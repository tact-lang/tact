struct DeepData {
    foo: Int;
    bar: Bool?;
}

contract OptChange {
    data: DeepData?;

    init() {
        self.data = null;
    }

    receive() {
        self.data = DeepData{
            foo: 777,
            bar: true,
        };
    }
}