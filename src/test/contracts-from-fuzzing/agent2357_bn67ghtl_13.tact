struct Inner {
    intval: Int;
    optval: Int?;
}

struct Outer {
    inn: Inner;
    optinn: Inner?;
}

contract StructsOptionalNest {
    val: Outer = Outer{
        inn: Inner{ intval: 10, optval: null },
        optinn: null
    };

    init() {
        self.val = Outer{
            inn: Inner{ intval: 5, optval: null },
            optinn: null
        };
    }
}
