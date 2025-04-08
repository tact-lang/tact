struct S1 { val: Int }
struct S2 { val: S1 }
struct S3 { val: S2 }
struct S4 { val: S3 }
struct S5 { val: S4 }

contract ExtremelyDeep {
    x: S5;

    init() {
        self.x = S5{ val: S4{ val: S3{ val: S2{ val: S1{ val: 5 } } } } };
    }

    receive() {}
}