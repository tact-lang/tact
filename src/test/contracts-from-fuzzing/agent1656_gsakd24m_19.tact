struct UnaryOptional {
    val: Int?;
}

contract InitNullSet {
    state: UnaryOptional;

    init() {
        self.state = UnaryOptional{ val: null };
    }
}