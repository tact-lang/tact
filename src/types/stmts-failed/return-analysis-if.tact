primitive Int;
primitive Bool;
trait BaseTrait { }

contract Foo {
    get fun notAlwaysReachableReturn(b: Bool): Int {
        if b {
            return 42;
        }
        // ERROR: no return statement
    }
}
