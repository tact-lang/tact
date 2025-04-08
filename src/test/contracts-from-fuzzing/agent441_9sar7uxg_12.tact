struct Params1 {
    a: Int;
    b: Bool;
}

struct Params2 {
    c: String;
    d: Address;
}

struct Combined {
    p1: Params1;
    p2: Params2;
}

contract TestContract {
    data: Combined;

    init() {
        self.data = Combined{
            p1: Params1{ a: 1, b: true },
            p2: Params2{ c: "hi", d: myAddress() },
        };
    }
}