struct Nest1 {
    a: Int;
}

struct Nest2 {
    n: Nest1;
}

contract TestContract {
    n2: Nest2 = Nest2{n: Nest1{a: 5}};

    init() {
        self.n2 = Nest2{n: Nest1{a: 42}};
    }
}