struct Wrapped {
    a: Int;
    b: Int?;
}

contract DefaultedStruct {
    w: Wrapped = Wrapped{ a: 10, b: null };

    init() {
        self.w = Wrapped{ a: 15, b: null };
    }
}