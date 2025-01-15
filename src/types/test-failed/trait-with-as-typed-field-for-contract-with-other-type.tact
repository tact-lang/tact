primitive Int;
primitive Cell;

trait BaseTrait {}

trait Foo {
    f: Int as int32;
}

contract SomeContract with Foo {
    f: Cell;

    init(f: Cell) {
        self.f = f;
    }
}
