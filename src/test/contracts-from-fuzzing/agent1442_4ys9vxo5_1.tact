struct Nested {
    value: Int;
}

contract DeepOptional {
    nestedOpt: Nested?; 
    init() {
        self.nestedOpt = null;
    }
}