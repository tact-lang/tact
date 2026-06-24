struct Boo {
    b: Bool;
}

contract BoolAlone {
    f: Boo;

    init() {
        self.f = Boo{ b:false };
    }
}