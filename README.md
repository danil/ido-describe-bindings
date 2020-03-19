[![MELPA](https://melpa.org/packages/ido-describe-bindings-badge.svg)](https://melpa.org/#/ido-describe-bindings)

# Ido describe bindings

`ido-describe-bindings` deprecated, use [counsel-descbinds](https://github.com/abo-abo/swiper/blob/8fae568daafdc79d4990ad739bac42ee230d3234/counsel.el#L1152)

Yet another [describe-bindings][] with [ido][].

[describe-bindings]: https://www.gnu.org/software/emacs/manual/html_node/elisp/Help-Functions.html#index-Helper_002ddescribe_002dbindings
[ido]: http://emacswiki.org/emacs/InteractivelyDoThings

![ido-describe-bindings](https://raw.githubusercontent.com/danil/ido-describe-bindings/master/ido-describe-bindings.png)

Inspired by Chris Barrett's `show-key-bindings` function
<https://stackoverflow.com/questions/15938272/is-there-an-emacs-encyclopedia-of-keybindings#15939667>

## Dependencies

* [ido][]
* [dash][]

[dash]: https://github.com/magnars/dash.el

## Installation

Via [melpa][]: `M-x package-install ido-describe-bindings`.

[melpa]: https://melpa.org/#/ido-describe-bindings

## Settings

You may want to bind `ido-describe-bindings` to a convenient
keystroke. In my setup, I bound it to `b` in `help-map`.
By default it is `C-h b`.

    (eval-after-load 'help
                     (define-key help-map (kbd "b") 'ido-describe-bindings))

### Optionally

You can configure [ido-vertical-mode][] or [ido-grid-mode][]

[ido-vertical-mode]: https://github.com/creichert/ido-vertical-mode.el
[ido-grid-mode]: https://github.com/larkery/ido-grid-mode.el

## Alternatives

* [helm-descbinds][]

[helm-descbinds]: https://github.com/emacs-helm/helm-descbinds
