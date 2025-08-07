<?php

namespace GosaPureftpd\personal\connectivity\pureftpd;

$success = bindtextdomain('GosaPureftpd', dirname(dirname(__FILE__)) . '/locale/compiled');

function __(string $GETTEXT): string
{
    return dgettext('GosaPureftpd', $GETTEXT);
}
