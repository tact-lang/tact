struct NestedOptionals {
    a: Int?;
    b: Inner?;
}

struct Inner {
    c: Int?;
    d: Bool?;
}

contract NestedStructWithOptionals {
    val: NestedOptionals;

    init() {
        self.val = NestedOptionals{
            a: null,
            b: Inner{
                c: 10,
                d: null
            }
        };
    }
}