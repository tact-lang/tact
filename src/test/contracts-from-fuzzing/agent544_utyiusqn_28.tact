struct Foo { f: Int = 7; }
struct Bar { b: Foo = Foo{}; }

contract TestContract {
    x: Bar;

    init() {
        self.x = Bar{};
    }
}