struct WithOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalContract {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            x: null,
            y: true,
            z: "Hello"
        };
    }
}