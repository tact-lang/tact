primitive Int;

trait BaseTrait { }

trait TestTrait {
    someField: Int;
}

contract Test with TestTrait {
    someField: Int;

    init() {
        self.someField = 42;
    }

    receive() {
        someField = 42;
    }
}
