struct Opt1 {
    a: Int?;
}

struct Opt2 {
    b: Int?;
}

contract TestContract {
    o1: Opt1;
    o2: Opt2;

    init() {
        self.o1 = Opt1{ a: null };
        self.o2 = Opt2{ b: null };
    }
}