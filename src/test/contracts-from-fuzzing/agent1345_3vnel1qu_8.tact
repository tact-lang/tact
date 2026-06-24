// test repeated field names in nested structs
struct First {
    data: Int;
}

struct Second {
    data: String;
}

contract Test {
    a: First;
    b: Second;

    init() {
        self.a = First{ data: 1 };
        self.b = Second{ data: "bla" };
    }
}