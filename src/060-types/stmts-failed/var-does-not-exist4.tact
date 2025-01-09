primitive Int;

trait BaseTrait { }

trait TestTrait {
    someField: Int;

    receive() {
        someField = 42;
    }
}