struct OptNest {
    nested: String?;
}

contract Test {
    on: OptNest = OptNest{
        nested: null
    };

    init() {}
}