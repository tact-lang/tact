// Many nested, all levels optional
struct A { b: B?; }
struct B { c: C?; }
struct C { d: D?; }
struct D { e: E?; }
struct E { x: Int?; y: String?; }

contract AllOptional {
    root: A?;

    init() {
        self.root = null;
    }

    receive() {}
}