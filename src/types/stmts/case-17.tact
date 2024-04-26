primitive Int;
primitive Bool;
trait BaseTrait { }

contract Foo {
    get fun noReturn() {
        let x: Int = 42;
        x += 1;
        // it's since the function does not return anything
    }
}
