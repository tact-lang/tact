struct A1 { a: Int }
struct A2 { a: A1 }
struct A3 { a: A2 }
struct A4 { a: A3 }
struct A5 { a: A4 }

contract FiveDeep {
    field: A5;

    init() {
        self.field = A5{ a: A4{ a: A3{ a: A2{ a: A1{ a:5 } } } } };
    }
}