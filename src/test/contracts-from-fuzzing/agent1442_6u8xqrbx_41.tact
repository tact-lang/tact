// edge: nested structs with some optional and some defaulted null
struct Foo { val: Int? = null; }
struct Bar { foo: Foo?; }

contract TestContract {
    bar: Bar;
    init() {
        self.bar = Bar{foo: null};
    }
}