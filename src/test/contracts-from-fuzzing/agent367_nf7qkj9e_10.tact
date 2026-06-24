struct Foo { x: Int; y: Int; z: Int }

struct Bar { foo: Foo; flag: Bool }

struct Baz { bar: Bar; s: String }

contract ManyLayers {
    baz: Baz;

    init() {
        self.baz = Baz{
            bar: Bar{
                foo: Foo{
                    x: 1,
                    y: 2,
                    z: 3,
                },
                flag: true,
            },
            s: "nested",
        };
    }
}