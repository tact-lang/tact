struct SOptional {
    a: Int?;
}

contract MultiAssignOptional {
    s: SOptional;

    init() {
        self.s = SOptional{ a:null };
        self.s = SOptional{ a:5 };
    }
}