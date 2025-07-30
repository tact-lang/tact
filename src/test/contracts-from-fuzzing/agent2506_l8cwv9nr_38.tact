struct EmptyOptional {
    optStr: String?;
}

contract SetEmptyStruct {
    f: EmptyOptional;
    init() {
        self.f = EmptyOptional{ optStr: null };
    }
}
