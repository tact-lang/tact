primitive Int;

trait BaseTrait {}

trait Foo {
    f: Int;
}

contract SomeContract with Foo {
    f: Int as coins;
}
