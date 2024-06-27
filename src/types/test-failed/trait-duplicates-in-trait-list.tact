trait BaseTrait {}

trait Foo {
    receive("comment") { }
}

trait Test with Foo, Foo { }

