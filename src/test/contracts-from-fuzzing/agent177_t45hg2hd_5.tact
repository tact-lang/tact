struct Nested {
    x: Int = 5;
}

contract OptionalOptionalContract {
    testOpt: Nested? = null;

    init() {
        self.testOpt = null;
    }
    
    receive() {}
}