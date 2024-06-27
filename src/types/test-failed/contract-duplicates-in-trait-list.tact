trait BaseTrait {}

trait Foo {
    receive("comment") { }
}

contract Test with Foo, Foo { }

