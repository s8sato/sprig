# sprig

  - [What's this](#whats-this)
    - [Concept Movie](#concept-movie)
    - [Demo](#demo)
  - [How to Use](#how-to-use)
    - [Tutorial Movie](#tutorial-movie)

<!-- EXTERNAL LINK -->
[Concept]: https://youtu.be/4MatFmieAwE
[Demo1]: https://demo.sprig.work/
[Demo2]: https://s8sato.github.io/sprig/
[Docker]: https://docs.docker.com/get-docker/
[Placeholder]: https://github.com/s8sato/sprig-web/blob/stg/src/Page/App/Placeholder.elm
[SendGrid]: https://sendgrid.com/
[SparkPost]: https://sparkpost.com/
[Tips]: https://github.com/s8sato/tips
[Tutorial]: https://youtu.be/PhxihW87N74

<!-- INTERNAL LINK -->
[Schematic View]: etc/schematic_view.jpg
[Screen]: etc/screen_description.jpg
[Screen-ja]: etc/screen_description-ja.jpg

![Schematic View][Schematic View]

## What's this

___Sprig___, the Task Breaker ⚡

![Screen Description][Screen]

![Screen Description in Japanese][Screen-ja]

### [Concept Movie][Concept]

### Zen of Sprig

* ___List up, and enter as is.___
* ___Break it down into processable units.___
* ___Focus on the top task.___

### [Demo][Demo2]

* A random username and the same password will be issued.
* Click username to logout to create another account.
* Data may be deleted without notice.

1. Demo on Amazon ECS -- pending
2. [Demo on GitHub Pages & Heroku][Demo2]
   * The response may be delayed, because the API server will sleep if there is no access for a while.

## How to Use

### [Tutorial Movie][Tutorial]

### Input Syntax

See input area [Placeholder][Placeholder].

### Shortcuts

|                             Icon                              |           Shortcut | Operation                                         |
| :-----------------------------------------------------------: | -----------------: | ------------------------------------------------- |
|                                                               |                    | __INPUT__                                         |
|                                                               |                `/` | focus input area                                  |
|                                                               |         `Ctrl` `↓` | maximize input area                               |
|                                                               |              `Tab` | indent                                            |
|                                                               |      `Shift` `Tab` | unindent                                          |
|                                                               |     `Ctrl` `Enter` | send                                            |
|                                                               |         `Ctrl` `↑` | minimize input area                               |
|                                                               |              `Esc` | blur input area                                   |
|                                                               |                    | __NAVIGATE__                                      |
| <img src="docs/images/cmd_jk.png" width="24px" align="center"> |         `J` \| `K` | down & up cursor                                  |
| <img src="docs/images/cmd_x.png" width="24px" align="center">  |                `X` | select item at cursor                             |
| <img src="docs/images/cmd_u.png" width="24px" align="center">  |                `U` | open URL of item at cursor in new tab             |
| <img src="docs/images/cmd_i.png" width="24px" align="center">  |                `I` | Invert selection                                  |
|                                                               |                    | __EDIT__                                          |
| <img src="docs/images/cmd_s.png" width="24px" align="center">  |                `S` | Star item at cursor                               |
| <img src="docs/images/cmd_e.png" width="24px" align="center">  |                `E` | Execute selected items to archives                |
| <img src="docs/images/cmd_e.png" width="24px" align="center">  | `V` \| `Shift` `E` | reVert selected items to home                     |
| <img src="docs/images/cmd_c.png" width="24px" align="center">  |                `C` | Clone selected items to input area                |
|                                                                |                `D` | Delete selected items permanently                |
|                                                               |                    | __VIEW__                                          |
| <img src="docs/images/cmd_qp.png" width="24px" align="center"> |         `Q` \| `P` | time scale                                        |
| <img src="docs/images/cmd_wo.png" width="24px" align="center"> |         `W` \| `O` | time shift                                        |
| <img src="docs/images/cmd_f.png" width="24px" align="center">  |                `F` | Focus item at cursor: view directly related items |
| <img src="docs/images/cmd_a.png" width="24px" align="center">  |                `A` | Archives                                          |
| <img src="docs/images/cmd_r.png" width="24px" align="center">  |                `R` | Roots: items with no successor                    |
| <img src="docs/images/cmd_l.png" width="24px" align="center">  |                `L` | Leaves: items with no predecessor                 |
| <img src="docs/images/cmd_h.png" width="24px" align="center">  |                `H` | Home                                              |

### Logout

Click username.

## Now developing...

- [x] Keyboard-oriented mode
- [ ] Touch-oriented mode
