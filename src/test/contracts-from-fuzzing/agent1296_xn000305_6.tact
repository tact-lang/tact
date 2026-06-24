struct OptionalStruct {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    val: OptionalStruct;

    init() {
        self.val = OptionalStruct{
            a: null,
            b: true,
            c: null,
        };
    }
}