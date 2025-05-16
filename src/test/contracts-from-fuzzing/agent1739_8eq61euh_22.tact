struct MultipleNestedOptionals {
    a: Int?;
    b: Nested?
}

struct Nested {
    x: Int?;
    y: Bool?;
    z: Inner?;
}

struct Inner {
    s: String?;
    c: Cell?;
}

contract Test {
    data: MultipleNestedOptionals;
    init() {
        self.data = MultipleNestedOptionals{
            a:null,
            b:null
        };
    }
}
