primitive Int;

trait BaseTrait {}

trait Trait {
    i: Int as int257;
}

contract Foo with Trait {
    i: Int as coins = 0;
}
