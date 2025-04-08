struct Foo { a: Int }
struct Bar { b: Foo }
struct Baz { c: Bar }

contract MixOrder {
    y: Int;
    z: Baz;
    x: String;

    init() {
        self.y = 1;
        self.z = Baz{ c: Bar{ b: Foo{ a:2 }}};
        self.x = "hi";
    }
}