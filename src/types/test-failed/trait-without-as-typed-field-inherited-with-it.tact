primitive Int;

trait BaseTrait {}

trait Foo {
    f: Int;
}

trait SomeTrait with Foo {
    f: Int as int32;
}

contract SomeContract with Foo {
    f: Int as int32;
}
