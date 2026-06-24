struct OptionalBoolStruct {
    a: Int;
    b: Bool?;
}

contract TestContract {
    val: OptionalBoolStruct;

    init() {
        self.val = OptionalBoolStruct{
            a: 1,
            b: null,
        };
    }
}