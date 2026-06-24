struct Foo { x: Int }
struct Bar { y: Int }
struct Baz { z: Int }

struct LargeNested {
    foo: Foo;
    bar: Bar;
    baz: Baz;
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
}

contract Combo {
    data: LargeNested;
    init() {
        self.data = LargeNested{
            foo: Foo{ x: 1 },
            bar: Bar{ y: 2 },
            baz: Baz{ z: 3 },
            i1: 4,
            i2: 5,
            i3: 6,
            i4: 7,
            i5: 8
        };
    }
}