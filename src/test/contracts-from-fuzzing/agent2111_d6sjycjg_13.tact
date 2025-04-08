// contract uses nested struct where one nested struct field is optional, others concrete
struct Leaf {
    foo: Bool;
    bar: Int;
}

struct Middle {
    optLeaf: Leaf?;
    val: Int;
}

contract OptionalLeaf {
    field: Middle;

    init() {
        self.field = Middle{
            optLeaf: null,
            val: 10
        };
    }
}