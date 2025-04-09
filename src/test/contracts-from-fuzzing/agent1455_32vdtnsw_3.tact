struct OptStruct {
    data: String = "opt";
}

contract TestContract {
    maybeStruct: OptStruct? = null;
    init() {}
}
