struct OptionalNested {
    x: Int = 10;
}

contract TestContract {
    maybeNested: OptionalNested? = null;
    
    init() {}
}
