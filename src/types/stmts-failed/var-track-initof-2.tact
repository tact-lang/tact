primitive Int;
trait BaseTrait {}

contract Test {

    a: Int;

    init(v: Int) {
        self.a = 5;
        v / self.a;    // OK
        self.a = 0;
        v / self.a;    // Division by zero
    }
}