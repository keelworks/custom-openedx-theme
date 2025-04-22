# Assign themes only if no other theme exists yet
./manage.py lms shell -c "
import sys
from django.contrib.sites.models import Site
def assign_theme(domain):
    site, _ = Site.objects.get_or_create(domain=domain)
    if not site.themes.exists():
        site.themes.create(theme_dir_name='indigo')

assign_theme('lms.test.keelworks.org')
assign_theme('lms.test.keelworks.org')
assign_theme('lms.test.keelworks.org:8000')
assign_theme('studio.test.keelworks.org')
assign_theme('studio.test.keelworks.org:8001')
assign_theme('preview.lms.test.keelworks.org')
assign_theme('preview.lms.test.keelworks.org:8000')
"