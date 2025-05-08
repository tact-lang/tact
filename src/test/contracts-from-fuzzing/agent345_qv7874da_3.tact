struct Sub {
    f1: Int;
    f2: Bool;
}

struct Nested {
    s1: Sub;
    s2: Sub;
}

contract TestContract {
    val: Nested;

    init() {
        self.val = Nested{
            s1: Sub{ f1: 1, f2: true },
            s2: Sub{ f1: 2, f2: false }
        };
    }
}