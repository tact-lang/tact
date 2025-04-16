// Contract with only optional composite (struct) storage
struct OptStruct {
    name: String;
    valid: Bool;
}

contract TestContract {
    maybeData: OptStruct?;

    init() {
        self.maybeData = null;
    }
}
