[![MELPA](http://melpa.org/packages/ido-describe-bindings-badge.svg)](http://melpa.org/#/ido-describe-bindings)

# Ido describe bindings

Yet another [describe-bindings][] with [ido][].

[describe-bindings]: http://www.gnu.org/software/emacs/manual/html_node/elisp/Help-Functions.html#index-Helper_002ddescribe_002dbindings
[ido]: http://emacswiki.org/emacs/InteractivelyDoThings

![ido-describe-bindings](https://raw.githubusercontent.com/danil/ido-describe-bindings/master/ido-describe-bindings.png)

Inspired by Chris Barrett's `show-key-bindings` function
<http://stackoverflow.com/questions/15938272/is-there-an-emacs-encyclopedia-of-keybindings#15939667>

## Dependencies

* [ido][]
* [ido-vertical-mode][]
* [dash][]

[ido-vertical-mode]: https://github.com/creichert/ido-vertical-mode.el
[dash]: https://github.com/magnars/dash.el

## Installation

Via [melpa](http://melpa.org): `M-x package-install ido-describe-bindings`.

If you are not set up `ido-vertical-mode`, you can configure it
according to [readme][ido-vertical-mode-readme].

[ido-vertical-mode-readme]: https://github.com/creichert/ido-vertical-mode.el#turn-it-on

## Alternatives

* [helm-descbinds][]

[helm-descbinds]: https://github.com/emacs-helm/helm-descbinds
