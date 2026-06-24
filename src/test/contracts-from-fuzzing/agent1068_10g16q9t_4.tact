struct Inner {
    x: Int;
    y: Bool?;
}

contract TestContract {
    optStruct: Inner?;

    init() {
        self.optStruct = null;
    }

    receive() {
        self.optStruct = self.optStruct;
    }
}
