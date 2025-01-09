primitive Int;
trait BaseTrait {}

contract MyContract {
    counter: Int = 0;
    test_field: Int;

    receive("increment") {
        self.counter += 1;
    }

    get fun getCounter(): Int {
        return self.counter;
    }

    get fun getTestField(): Int {
        return self.test_field;
    }
}