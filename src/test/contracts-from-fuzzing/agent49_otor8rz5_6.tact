struct Data {
    x: Int?;
    y: Bool?;
    z: String;
}

contract TestContract {
    nestedOpt: Data?;

    init() {
        self.nestedOpt = Data{
            x: null,
            y: true,
            z: "hello",
        };
    }
}
