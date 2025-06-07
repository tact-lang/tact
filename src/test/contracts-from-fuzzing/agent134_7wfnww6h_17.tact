struct NestedOpt {
    foo: Int?; // implicit null
    bar: Bool? = null; // explicit null
}

contract NestedImplicitExplicit {
    s: NestedOpt = NestedOpt{};
}