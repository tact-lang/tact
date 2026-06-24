struct Base {
    x: Int;
}

struct Ext {
    base: Base;
    y: Int;
}

contract ComposeInCompose {
    inside: Ext;

    init() {
        self.inside = Ext{ base: Base{x:1}, y:2 };
    }
}