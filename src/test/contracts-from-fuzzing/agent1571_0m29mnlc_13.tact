message(0x22) MsgB { bar: Int }

struct Inner {
    m: MsgB?;
    flag: Bool;
}

struct Outer {
    nestedOpt: Inner?;
    x: Int;
}

contract TestContract {
    data: Outer = Outer{ nestedOpt: null, x: 0 };

    init() {
        self.data = Outer{
            nestedOpt: Inner{
                m: MsgB{ bar: 5 },
                flag: true
            },
            x: 88
        };
    }
}