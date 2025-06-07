struct S1 { x: Int; }

contract TestDeeplyNested {
    val: S1;

    init() {
        self.val = S1 { x: 42 };
    }
}