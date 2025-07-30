struct OptionalStringStruct {
    a: Int;
    b: String?;
}

contract TestContract {
    val: OptionalStringStruct;

    init() {
        self.val = OptionalStringStruct{
            a: 1,
            b: null,
        };
    }
}