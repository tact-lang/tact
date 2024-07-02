trait BaseTrait { }

contract Test {
    init() {
        self.nonExistentField = 42;
    }
}
