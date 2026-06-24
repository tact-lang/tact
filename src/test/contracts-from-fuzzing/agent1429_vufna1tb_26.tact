struct Foo { val: Bool; }

struct Bar { f: Foo?; }

contract OptStructField {
    b: Bar;

    init() {
        self.b = Bar{ f: null };
    }
}
