struct S1 {
    x: Int;
    y: Int?;
}

struct S2 {
    inner: S1;
    flag: Bool?;
}

contract NestedOptionalStructs {
    val: S2;

    init() {
        self.val = S2{
            inner: S1{x: 1, y: null},
            flag: true
        };
    }
}