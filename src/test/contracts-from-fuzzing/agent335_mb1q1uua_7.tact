struct OptionalInner {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructContract {
    data: OptionalInner;

    init() {
        self.data = OptionalInner{
            x: null,
            y: true,
            z: null,
        };
    }
}