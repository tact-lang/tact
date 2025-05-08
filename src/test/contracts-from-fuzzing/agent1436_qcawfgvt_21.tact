// Contract field initialized with empty struct literal explicitly
struct Cont {
    a: Int;
    f: Bool;
}

contract TestContract {
    d: Cont;

    init() {
        self.d = Cont{a: 0, f: false};
    }
}
