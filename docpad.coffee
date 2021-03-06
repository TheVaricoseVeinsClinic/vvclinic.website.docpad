# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The production url of our website
			url: "http://www.thevaricoseveinsclinic.co.uk"

			# The default title of our website
			title: "The Varicose Veins Clinic"

			# The website description (for SEO)
			description: """
				Professional, expert varicose vein treatment from caring specialists
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				veins, varicose, varicose veins, vein removal, thread veins, laser therapy, evla, evlt, rfa, radiofrequency
				"""

			telephone: "0800 999 1123"
			telephone_url: "tel:08009991123"
			fax_number: "01276 526868"

			mini_consult_duration: "10"

			# Google business place ID, needed to make a reviews link
			# https://developers.google.com/places/place-id
			google_place_id: "ChIJ20ZbKjfVdUgRF2Roi2wvV1o"

      # Ref: http://blog.danielw.co/Sending-Email-from-Github-Pages/
      # btoa("//formspree.io/mail@thevaricoseveinsclinic.co.uk")
			formspree_email_url: 'Ly9mb3Jtc3ByZWUuaW8vbWFpbEB0aGV2YXJpY29zZXZlaW5zY2xpbmljLmNvLnVr'

		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

		getGoogleReviewURL: ->
			"http://search.google.com/local/writereview?placeid=#{@site.google_place_id}"
			 
	plugins:
	    ghpages:
	        deployRemote: 'target'
	        deployBranch: 'master'
	    nodesass:
	    	outputStyle: 'compressed'	# nested / compressed
	    # grunt:
	    # 	writeAfter: false
	    # 	generateAfter: []
	    # 	warnOnError: true
		cleancss:
	        # These are options passed to the clean-css dependency
	        cleancssOpts:
	            # * for keeping all (default), 1 for keeping first one only, 0 for removing all
	            keepSpecialComments: '0'

	            # Whether to keep line breaks
	            keepBreaks: false

	            # Turns on benchmarking mode measuring time spent on cleaning up.
	            benchmark: true

	            # Whether to process @import rules.
	            processImport: false

	            # Set to false to skip URL rebasing
	            rebase: false

	            # Set to false to disable advanced optimizations
	            advanced: false

	            # Set to true to get minification statistics under stats property
	            debug: false

	        # Disabled on development environments by default.
	        environments:
	            development:
	                enabled: true
}

# Export the DocPad Configuration
module.exports = docpadConfig
