struct Small {
    x: Int;
    y: Int;
}

contract UseSmall {
    small: Small;

    init() {
        self.small = Small{x: 1, y: 2};
    }
}
