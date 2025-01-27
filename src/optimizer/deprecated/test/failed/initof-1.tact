primitive Int;
trait BaseTrait {}

contract Test {

    a: Int = 0;

    init(v: Int) {
        self.a / self.a;    // Division by zero
    }
}