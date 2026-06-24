struct Tiny {
    x: Int;
    y: Bool;
}
contract DefaultTiny {
    data: Tiny;

    init() {
        self.data = Tiny {
            x: 5,
            y: true,
        };
    }
}