struct OptionalBool {
    flag: Bool?;
}

contract TestContract {
    data: OptionalBool;

    init() {
        self.data = OptionalBool{flag: null};
    }
}