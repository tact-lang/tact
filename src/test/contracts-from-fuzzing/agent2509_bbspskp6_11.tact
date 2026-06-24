struct A1 { a: Int; }
struct A2 { a1: A1; }
struct A3 { a2: A2; }
struct A4 { a3: A3; }
struct A5 { a4: A4; }

contract DeepFive {
    deep: A5;

    init() {
        self.deep = A5{ a4: A4{ a3: A3{ a2: A2{ a1: A1{ a: 1 } } } } };
    }
}