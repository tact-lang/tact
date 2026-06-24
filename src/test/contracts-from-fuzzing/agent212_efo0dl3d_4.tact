struct Inner {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Slice;
    f6: Cell;
}

struct Middle {
    i1: Inner;
    optInner: Inner?;
    txt: String = "default";
}

contract TestContract {
    complex: Middle;

    init() {
        self.complex = Middle{
            i1: Inner{
                f1: 1,
                f2: true,
                f3: "hi",
                f4: myAddress(),
                f5: emptyCell().asSlice(),
                f6: emptyCell(),
            },
            optInner: null,
            txt: "override"
        };
    }
}