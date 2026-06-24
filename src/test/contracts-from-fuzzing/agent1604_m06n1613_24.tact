struct OnlyOptional {
    x: Int?;
    y: Bool?;
}

contract AllOptional {
    s: OnlyOptional;

    init() {
        self.s = OnlyOptional{ x: null, y: null };
    }

    receive() {}
}