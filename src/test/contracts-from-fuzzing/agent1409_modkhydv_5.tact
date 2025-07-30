struct Nest3 {
    x: Int;
}

struct Nest2 {
    n3: Nest3;
}

struct Nest1 {
    n2: Nest2;
}

contract Test {
    deep: Nest1;
    init() {
        self.deep = Nest1{ n2: Nest2{ n3: Nest3{ x: 42 } } };
    }
    receive() { let _ = self.deep.n2.n3.x; }
}