struct WrappedString { s: String }
struct WrappedInt { i: Int }

struct WrapBoth {
    wstr: WrappedString;
    wint: WrappedInt;
}

contract WrapNest {
    store: WrapBoth;

    init() {
        self.store = WrapBoth{
            wstr: WrappedString{ s: "abc" },
            wint: WrappedInt{ i: 555 }
        };
    }
}