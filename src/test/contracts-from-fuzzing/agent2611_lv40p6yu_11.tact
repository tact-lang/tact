struct S {
    n1: Int;
    n2: Int?;
    n3: String;
    n4: Bool?;
    n5: Address;
    n6: Cell?;
    n7: Slice;
}

contract MixNestedOpt {
    s: S;

    init() {
        self.s = S{
            n1: 1,
            n2: null,
            n3: "abc",
            n4: null,
            n5: myAddress(),
            n6: null,
            n7: emptyCell().asSlice()
        };
    }
}