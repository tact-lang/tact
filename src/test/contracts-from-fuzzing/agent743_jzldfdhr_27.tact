struct Inner {
    c: Cell?;
    sl: Slice;
}

struct Middle {
    inner: Inner?;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    text: String?;
    addr: Address?;
}

contract FinalSmash {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    c: null,
                    sl: emptyCell().asSlice()
                },
                flag: true
            },
            text: null,
            addr: myAddress()
        };
    }
}