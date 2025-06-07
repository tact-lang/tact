struct OptStruct {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: OptStruct;

    init() {
        self.data = OptStruct{ x: null, y: true };
    }
}