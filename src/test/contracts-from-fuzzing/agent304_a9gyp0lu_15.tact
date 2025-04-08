struct Compose {
    x: Int;
    y: Bool;
}

contract ComposeDefault {
    first: Compose = Compose{ x: 0, y: false };
    init() {
        self.first = Compose{ x: 100, y: true };
    }
}
