struct OptStruct {
    s: String;
    b: Bool;
}

contract TestContract {
    os: OptStruct?;

    init() {
        self.os = null;
    }
}
