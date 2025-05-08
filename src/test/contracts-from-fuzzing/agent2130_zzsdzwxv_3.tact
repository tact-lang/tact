struct Third {
    z: String?;
}

struct Second {
    t: Third;
}

struct First {
    s: Second;
}

contract Test {
    data: First = First{ s: Second{ t: Third{ z: null } } };

    init() {
        self.data = First{ s: Second{ t: Third{ z: "hello" } } };
    }
}