primitive Int;
primitive Bool;
trait BaseTrait { }

contract Foo {
    get fun noReturn(): Int {
        let x: Int = 42;
        x += 1;
        // ERROR: no return statement
    }
}
