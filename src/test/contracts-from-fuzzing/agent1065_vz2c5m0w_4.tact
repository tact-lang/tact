struct WithOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalStructStorage {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            x: null,
            y: true,
            z: null,
        };
    }
}
