struct LargeNestedOne {
    a: Int;
    b: LargeNestedTwo;
    c: LargeNestedTwo;
    d: Bool;
}

struct LargeNestedTwo {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
}

contract StorageTest {
    val: LargeNestedOne;

    init() {
        self.val = LargeNestedOne{
            a: 1,
            b: LargeNestedTwo{ x1:11,x2:12,x3:13,x4:14,x5:15 },
            c: LargeNestedTwo{ x1:21,x2:22,x3:23,x4:24,x5:25 },
            d: true
        };
    }
}