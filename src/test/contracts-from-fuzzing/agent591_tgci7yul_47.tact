struct A1 { x: Int; }
struct A2 { a: A1; }
struct A3 { a: A2; }
struct A4 { a: A3; }
struct A5 { a: A4; }
struct A6 { a: A5; }
struct A7 { a: A6; }
struct A8 { a: A7; }

contract EightDeep {
    d: A8;
    init() {
        self.d = A8{ a: A7{ a: A6{ a: A5{ a: A4{ a: A3{ a: A2{ a: A1{ x:9 } } } } } } } };
    }
}