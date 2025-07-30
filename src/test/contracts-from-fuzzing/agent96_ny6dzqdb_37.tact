// nested optional in struct field
struct Inner {
    val: Int?;
}

struct Outer {
    nested: Inner?;
}

contract Test {
    var: Outer;

    init() {
        self.var = Outer{
            nested: null
        };
    }
}