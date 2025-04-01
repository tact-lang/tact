primitive Int;
primitive Bool;

trait BaseTrait {}

contract Foo {
    asm get fun illegalGetter(): Int {
        DEPTH
    }
}
