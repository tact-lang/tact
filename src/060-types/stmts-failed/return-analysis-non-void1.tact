primitive Int;
primitive Bool;
trait BaseTrait { }

contract Foo {
    get fun noReturn(): Int {
        // ERROR: no return statement
    }
}
