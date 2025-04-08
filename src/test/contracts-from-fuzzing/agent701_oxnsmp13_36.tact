struct Sub {
    a: Int;
}

contract ReplaceOptional {
    f: Sub?;

    init() {
        self.f = null;
        self.f = Sub{ a: 9 };
        self.f = null;
    }
}