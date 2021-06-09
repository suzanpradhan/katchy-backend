<?php

/* --------------------------------------------------------------------

  This file is part of katchy

  (c) David Rashid <rashid.david12@gmail.com>

  For the full copyright and license information, please view the LICENSE
  file that was distributed with this source code.

  --------------------------------------------------------------------- */

$route = function ($handler) {
    try {
        if (!$handler::checkAuthToken($_REQUEST['auth_token'])) {
            $handler->template = 'request-denied';

            return;
        }
        if (CHV\Login::isLoggedUser()) {
            CHV\Login::logout();
            @session_start();
            $access_token = $handler::getAuthToken();
            $handler::setVar('auth_token', $access_token);
        }
    } catch (Exception $e) {
        G\exception_to_error($e);
    }
};
