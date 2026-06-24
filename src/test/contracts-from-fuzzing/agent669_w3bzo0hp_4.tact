struct OptStruct {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{
            x: null,
            y: true,
            z: "hello"
        };
    }
}
