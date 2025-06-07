struct MultiOptionals {
    x: Int?;
    y: String?;
    z: Bool?;
}

contract OptAll {
    data: MultiOptionals;

    init() {
        self.data = MultiOptionals{
            x: null,
            y: null,
            z: null
        };
    }
}