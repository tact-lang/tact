struct OptionalStruct {
    a: Int;
    b: String;
}

contract OptionalFieldContract {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{
            a: 1,
            b: "test"
        };
    }
}