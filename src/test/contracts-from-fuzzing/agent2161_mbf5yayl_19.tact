// deeply nested combination Int and String fields
struct A { x: Int; y: String; }
struct B { a: A; z: String; }
struct C { b: B; w: Int; }

contract MixedDeepNest {
    state: C;

    init() {
        self.state = C{ b: B{ a: A{ x: 5, y: "foo" }, z: "bar" }, w: 9 };
    }
}