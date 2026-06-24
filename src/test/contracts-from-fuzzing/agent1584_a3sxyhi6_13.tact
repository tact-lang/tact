struct Inner {
    flag: Bool;
    tail: Slice as remaining;
}

struct Outer {
    num: Int;
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            num: 5,
            nested: Inner{
                flag: true,
                tail: emptyCell().asSlice()
            }
        };
    }
}