struct S1 {
    x: Int;
}

struct S2 {
    wrap: S1;
    flag: Bool;
}

contract NestedStructs {
    data: S2;

    init() {
        self.data = S2{wrap: S1{x: 42}, flag: false};
    }
}
