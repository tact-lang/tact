primitive Int;

trait BaseTrait { }

contract Test {
    someField: Int;

    init() {
        self.someField = 42;
    }

    receive() {
        someField = 42;
    }
}
