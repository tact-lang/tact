// Very large nested struct chain
struct A1 { a: Int; }
struct A2 { a: A1; }
struct A3 { a: A2; }
struct A4 { a: A3; }
struct A5 { a: A4; }
struct A6 { a: A5; }

contract Deep6 {
    root: A6;
    init() {
        self.root = A6{ a: A5{ a: A4{ a: A3{ a: A2{ a: A1{ a: 123 } } } } } };
    }
}
