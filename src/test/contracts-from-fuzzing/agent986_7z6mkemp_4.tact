struct A { x: Int; }
struct B { a: A; y: Bool; }
struct C { b: B; s: String; }

contract MultiNested {
    data: C;

    init() {
        self.data = C{ b: B{ a: A{ x: 1 }, y: false }, s: "hi" };
    }
}
