// test explicit init for Cell field in struct not default value
struct Foo {
    x: Cell;
    y: Int = 5;
}

contract TestContract {
    s: Foo;

    init() {
        self.s = Foo{x: emptyCell(), y: 123};
    }

    receive() {
        let _ = self.s.x;
        let _ = self.s.y;
    }
}