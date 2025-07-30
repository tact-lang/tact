struct Nested1 {
    a: Int?;
    b: String?;
}

struct Nested2 {
    n1: Nested1;
    flag: Bool;
}

contract TestContract {
    complex: Nested2;

    init() {
        self.complex = Nested2{
            n1: Nested1{ a:null, b:"hello" },
            flag: true,
        };
    }
}