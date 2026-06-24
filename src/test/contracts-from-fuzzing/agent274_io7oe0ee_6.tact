struct OptionalVsDefault {
    x: Int?;
    y: Int = 5;
    z: String?;
    k: Bool = true;
}

contract OptDefaultTest {
    data: OptionalVsDefault;

    init() {
        self.data = OptionalVsDefault{
            x: null,
            z: null,
        };
    }

    receive() {}
}
