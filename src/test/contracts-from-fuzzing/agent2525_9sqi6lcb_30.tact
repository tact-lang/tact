// Instantiating nested deeply nested, multiple compositional layer, optional omitted
struct Innermost {
    leaf: Int;
}

struct InnerMid {
    content: Innermost;
}

struct OuterMid {
    nested: InnerMid?;
    name: String = "ok";
}

contract TestContract {
    field: OuterMid;

    init() {
        self.field = OuterMid{};
    }
}