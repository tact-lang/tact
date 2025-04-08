struct Sub {
    a: Int;
}

struct Main {
    m: Sub;
    n: Int?;
}

contract NestedWithOptional {
    s: Main;

    init() {
        self.s = Main{ m: Sub{ a: 1 }, n: null };
    }
}