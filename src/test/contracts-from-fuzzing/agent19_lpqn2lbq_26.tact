struct OptionalBool {
    flag: Bool?;
}

contract TestContract {
    ob: OptionalBool;

    init() {
        self.ob = OptionalBool{flag:true};
    }
}