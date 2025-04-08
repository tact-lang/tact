struct Foo { a: Int = 3; b: Bool = false; }
struct Bar { f: Foo = Foo{}; n: Int = 42; }

contract TestContract {
    baz: Bar;

    init() {
        self.baz = Bar{
            f: Foo{ a: 99 },
            n: 100
        };
    }
}