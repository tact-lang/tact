struct BigNested {
    s1: S1;
    s2: S2;
}
struct S1 {
    x: Int;
    y: Bool;
}
struct S2 {
    y: S3;
}
struct S3 {
    z: Int?;
}
contract NestedCombo {
    val: BigNested;

    init() {
        self.val = BigNested{
            s1: S1{ x:1, y:false },
            s2: S2{ y: S3{ z:null } },
        };
    }
}