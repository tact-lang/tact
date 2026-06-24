struct NestedOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptStructTest {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            x: null,
            y: true,
            z: null,
        };
    }
}