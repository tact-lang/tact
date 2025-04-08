struct OptionalStruct {
    a: Int?;
    b: Int?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            a: null,
            b: 5,
        };
    }
}