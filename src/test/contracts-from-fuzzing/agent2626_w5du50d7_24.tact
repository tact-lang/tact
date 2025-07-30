struct S1 {
    x: Int;
    y: Int;
}
struct S2 {
    x: S1;
    y: S1;
}

contract NestedRep {
    val: S2;

    init() {
        self.val = S2{
            x: S1{x: 1, y: 2},
            y: S1{x: 3, y: 4}
        };
    }
}