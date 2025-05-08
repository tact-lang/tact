struct TinyInner {
    num: Int;
}

struct WrapTiny {
    data: TinyInner;
}

contract DefaultWrapNested {
    val: WrapTiny = WrapTiny{ data: TinyInner{ num: 9 } };

    init() {
        self.val = WrapTiny{ data: TinyInner{ num: 88 } };
    }
}