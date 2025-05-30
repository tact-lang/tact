struct MidOptional {
    mid: Int?;
}

contract DefaultedNestedOptional {
    s: MidOptional = MidOptional{ mid: null };

    init() {
        self.s = MidOptional{ mid: 123 };
    }
}