struct OptionalStruct {
    inner: Int?;
    optString: String?;
}

contract TestContract {
    optStruct: OptionalStruct?;

    init() {
        self.optStruct = OptionalStruct{
            inner: 123,
            optString: null
        };
    }
}