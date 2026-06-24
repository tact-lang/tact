struct HasOptional {
    id: Int;
    desc: String?;
}

contract InitWithOpt {
    f: HasOptional;
    init() {
        self.f = HasOptional{ id: 77, desc: null };
    }
}