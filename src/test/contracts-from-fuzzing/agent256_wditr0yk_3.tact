struct OptionalStruct {
    val: Int;
    flag: Bool;
}

contract TestContract {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{ val: 10, flag: true };
    }
}