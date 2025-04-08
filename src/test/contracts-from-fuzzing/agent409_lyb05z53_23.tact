struct OptionalBetween {
    a: Int;
    b: Int?;
    c: Int;
}

contract OptionalBetweenContract {
    data: OptionalBetween;

    init() {
        self.data = OptionalBetween{
            a: 1,
            b: null,
            c: 2,
        };
    }
}