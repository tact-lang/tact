struct ManyOpts {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: ManyOpts = ManyOpts{ x: null, y: null, z: null };

    init() {
        self.data = ManyOpts{ x: 213, y: true, z: "hello" };
    }
}