primitive Int;

trait BaseTrait {}

trait Foo {
    f: Int;
}

trait SomeTrait with Foo {
    f: Int as int257;
}
