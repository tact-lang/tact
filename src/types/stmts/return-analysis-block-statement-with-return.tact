primitive Int;
primitive Bool;
trait BaseTrait { }

contract Foo {
    get fun alwaysReachableReturn(b: Bool): Int {
        {
            return 42;
        }
    }
}
