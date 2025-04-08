struct Recursive1 {
    a: Int;
}

struct Recursive2 {
    b: Recursive1;
}

struct Recursive3 {
    c: Recursive2;
}

contract RecursiveStorage {
    r: Recursive3;

    init() {
        self.r = Recursive3{ c: Recursive2{ b: Recursive1{ a: 5 } } };
    }
}