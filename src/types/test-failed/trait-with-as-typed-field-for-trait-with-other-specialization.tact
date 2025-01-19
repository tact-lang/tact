primitive Int;

trait BaseTrait {}

trait Foo {
    f: Int as int32;
}

trait SomeTrait with Foo {
    f: Int as int16;
}
