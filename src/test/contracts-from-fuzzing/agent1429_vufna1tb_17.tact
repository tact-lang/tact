struct Foo { x: Int; }

struct Bar { y: Foo?; }

contract NestedOptionalStruct {
    z: Bar;

    init() {
        self.z = Bar{ y: null };
    }
}
