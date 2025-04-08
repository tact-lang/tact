struct A { x: Int; y: Bool; s: String }
struct B { z: A; note: String }

contract MixDefaults {
    foo: Int = 5;
    bar: Bool;
    baz: String?;
    nested: B;

    init() {
        self.bar = true;
        self.baz = null;
        self.nested = B{
            z: A{ x: 7, y: false, s: "nested" },
            note: "hello"
        };
    }
}