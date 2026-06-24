struct S1 { a: Int }
struct S2 { b: Int }
struct Holder {
    left: S1?;
    right: S2?;
}

contract NestedMultipleOptional {
    param: Holder;

    init() {
        self.param = Holder{ left: null, right: S2{ b: 100 } };
    }
}
