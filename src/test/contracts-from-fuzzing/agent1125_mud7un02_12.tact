struct MixedTypes {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    str: String;
}

contract TestContract {
    m: MixedTypes;

    init() {
        self.m = MixedTypes{
            i: 10,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "hi",
        };
    }
}