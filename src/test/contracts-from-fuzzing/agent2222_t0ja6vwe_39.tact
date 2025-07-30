struct DeepIn {
    level: Int;
}

struct Wrap1 {
    d: DeepIn;
}

struct Wrap2 {
    w: Wrap1;
}

contract TestContract {
    f: Wrap2;

    init() {
        self.f = Wrap2{ w:Wrap1{d:DeepIn{level:44}} };
    }
}