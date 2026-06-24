struct HasOptional {
    o: Int?;
}

contract DefaultOptional {
    s: HasOptional;

    init() {
        self.s = HasOptional{ o: null };
    }
}