struct OptionalStruct {
    data: Int?;
}

contract TestContract {
    rec: OptionalStruct?;

    init() {
        self.rec = OptionalStruct{
            data: 42
        };
    }
}
