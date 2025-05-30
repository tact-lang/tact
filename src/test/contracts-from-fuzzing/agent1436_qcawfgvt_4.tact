struct OptExample {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: OptExample;

    init() {
        self.data = OptExample{
            x: null,
            y: true,
            z: null,
        };
    }
}
