struct A1 { f1: Int }
struct A2 { f2: A1 }
struct A3 { f3: A2 }
struct A4 { f4: A3 }

contract Deep4 {
    obj: A4;
    init() {
        self.obj = A4{ f4: A3{ f3: A2{ f2: A1{ f1: 42 } } } };
    }
}