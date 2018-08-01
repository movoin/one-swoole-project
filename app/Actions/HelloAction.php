<?php
/**
 * This file is part of the One package.
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 *
 * @package     App\Actions
 * @author      Allen Luo <movoin@gmail.com>
 * @since       0.1
 */

namespace App\Actions;

use One\Context\Action;
use One\Context\Payload;
use One\Protocol\Contracts\Request;

/**
 * Hello Action
 *
 * @methods GET
 * @route /hello
 */
class HelloAction extends Action
{
    /**
     * 响应请求
     *
     * @param  \One\Protocol\Contracts\Request  $request
     *
     * @return \One\Context\Contracts\Payload
     */
    protected function run(Request $request)
    {
        return new Payload(200, 'Ok', '', 'Hello World');
    }
}
