struct OptionalInBetween {
    int1: Int;
    optionalMiddle: String?;
    int2: Int;
}

contract OptionalMiddleContract {
    data: OptionalInBetween;

    init() {
        self.data = OptionalInBetween{
            int1: 1,
            optionalMiddle: null,
            int2: 2
        };
    }
}