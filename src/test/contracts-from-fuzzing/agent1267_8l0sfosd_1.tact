struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract DeepOptional {
    val1: Int?;
    val2: Bool?;
    nested: Nested?;

    init() {
        self.val1 = null;
        self.val2 = false;
        self.nested = null;
    }
}

contract Use {
    receive() {
        // Just reference DeepOptional type
        let dummy: DeepOptional? = null;
    }
}