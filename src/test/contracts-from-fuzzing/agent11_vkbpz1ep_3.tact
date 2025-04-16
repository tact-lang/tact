struct OptStruct {
    str: String;
    num: Int;
}

contract TestContract {
    info: OptStruct?;

    init() {
        self.info = null;
    }
}