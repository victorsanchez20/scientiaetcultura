{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">

	{call_hook name="Templates::Index::journal"}

	{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<div class="homepage_image">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"{if $homepageImage.altText} alt="{$homepageImage.altText|escape}"{/if}>
		</div>
	{/if}

	{* Journal Description *}
	{if $activeTheme->getOption('showDescriptionInJournalIndex')}
		<section class="homepage_about">
			<a id="homepageAbout"></a>
			<h2>{translate key="about.aboutContext"}</h2>
			{$currentContext->getLocalizedData('description')}
				<div style="text-align: center; padding: 40px 20px; background: linear-gradient(180deg, #ffffff 0%, #f4f6fa 100%); border-radius: 12px; box-shadow: 0 6px 18px rgba(20,30,60,0.06); font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif; max-width: 800px; margin: 0 auto;"><img style="width: 120px; height: 120px; object-fit: cover; border-radius: 12px; border: 2px solid #dce1e8; box-shadow: 0 3px 8px rgba(0,0,0,0.08); margin-bottom: 20px;" src="http://localhost/ojs/public/site/images/admin/mceclip1.png" alt="Logo Scientia et Cultura" />
				<h1 style="margin: 0; font-size: 2rem; color: #0b2340; font-weight: bold; letter-spacing: 1px;">Scientia et Cultura</h1>
				<h2 style="margin: 8px 0 0 0; font-size: 1.25rem; color: #1f3c68; font-weight: 600;">In Unitate Progressus</h2>
				<p style="font-size: 1.05rem; color: #3e4c68; font-style: italic; margin-top: 10px;">“En la unidad está el progreso.”</p>
				<hr style="width: 60%; margin: 24px auto; border: 0; height: 1px; background: #d0d7e3;" />
				<p style="font-size: 1rem; color: #465a7a; max-width: 600px; margin: 0 auto;">El avance humano surge de la integración entre <strong>ciencia</strong>, <strong>arte</strong>, <strong>tecnología</strong> y <strong>cultura</strong>.</p>
				</div>
				<!--<p><img src="http://localhost/ojs/public/site/images/admin/mceclip1.png" /></p>
				<p><strong>Scientia et Cultura </strong></p>
				<p><strong> </strong><strong>In Unitate Progressus</strong></p>
				<p><strong>“En la unidad está el progreso.”</strong></p>
				<p><strong>El avance humano surge de la integración entre ciencia, arte, tecnología y cultura</strong></p>-->
		</section>
	{/if}

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<section class="cmp_announcements highlight_first">
			<a id="homepageAnnouncements"></a>
			<h2>
				{translate key="announcement.announcements"}
			</h2>
			{foreach name=announcements from=$announcements item=announcement}
				{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
					{break}
				{/if}
				{if $smarty.foreach.announcements.iteration == 1}
					{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
					<div class="more">
				{else}
					<article class="obj_announcement_summary">
						<h4>
							<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
								{$announcement->getLocalizedTitle()|escape}
							</a>
						</h4>
						<div class="date">
							{$announcement->getDatePosted()|date_format:$dateFormatShort}
						</div>
					</article>
				{/if}
			{/foreach}
			</div><!-- .more -->
		</section>
	{/if}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue">
			<a id="homepageIssue"></a>
			<h2>
				{translate key="journal.currentIssue"}
			</h2>
			<div class="current_issue_title">
				{$issue->getIssueIdentification()|strip_unsafe_html}
			</div>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</section>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
