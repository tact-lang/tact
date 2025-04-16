struct NestedWithOptional {
    a: Int?;
    b: Int?;
    sub: Sub?;
}

struct Sub {
    x: Int?;
    y: Bool?;
}

contract Test {
    val: NestedWithOptional;

    init() {
        self.val = NestedWithOptional{
            a: null,
            b: null,
            sub: Sub{
                x: null,
                y: null
            }
        };
    }
}