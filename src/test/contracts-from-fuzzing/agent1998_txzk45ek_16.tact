struct A { x: Int; }
struct B { y: Bool; }

contract OptionalStructs {
    a: A?;
    b: B?;

    init() {
        self.a = A{x:42};
        self.b = null;
    }
}