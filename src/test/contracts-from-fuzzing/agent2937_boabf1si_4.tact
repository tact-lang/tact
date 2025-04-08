struct WithOptionals {
    x: Int?;
    y: Bool?;
    z: Address?;
}

contract TestOptionalFields {
    data: WithOptionals;

    init() {
        self.data = WithOptionals{
            x: null,
            y: true,
            z: null
        };
    }
}