struct SingleOptional {
    a: Int?;
}

contract Test16 {
    f: SingleOptional;
    init() {
        self.f = SingleOptional{ a: null };
    }
}