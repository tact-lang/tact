struct Sub {
    f1: Int;
    f2: Bool;
}

contract OptNested {
    f: Sub?;
    init() {
        self.f = Sub{f1: 9, f2:false};
    }
}