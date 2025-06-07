struct NestedStr {
    a: Int;
    b: NestedStr2;
}

struct NestedStr2 {
    c: Int;
    d: Bool;
}

contract NestStrTest {
    val: NestedStr;

    init() {
        self.val = NestedStr{
            a: 5,
            b: NestedStr2{
                c: 8,
                d: true
            }
        };
    }
}