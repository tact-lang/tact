struct OptStruct {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}