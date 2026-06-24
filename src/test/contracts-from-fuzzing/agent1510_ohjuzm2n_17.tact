struct OptStruct {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    state: OptStruct? = null;

    init() {
        self.state = null;
    }

    receive() {
        let _ = self.state;
    }
}