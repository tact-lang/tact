primitive Bool;
primitive Int;
trait BaseTrait {}

contract Test {
    x: Int = 42;
    y: Int = 0;

    get fun foo(): Bool {
        return self == self;
    }
}
