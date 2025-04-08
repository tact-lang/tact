struct Wrap {
    count: Int;
}

struct WrapWrap {
    wrap: Wrap;
}

struct WrapWrapWrap {
    wrapwrap: WrapWrap;
}

contract Test {
    data: WrapWrapWrap;

    init() {
        self.data = WrapWrapWrap{
            wrapwrap: WrapWrap{
                wrap: Wrap{
                    count: 1234
                }
            }
        };
    }
}
