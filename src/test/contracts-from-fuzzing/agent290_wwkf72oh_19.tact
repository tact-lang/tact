struct OptionalNest {
    val: Int?;
    nested: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    opt: OptionalNest = OptionalNest{
        val: null,
        nested: null
    };
}
