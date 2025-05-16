struct OptionalStruct {
    inner: Inner?;
}

struct Inner {
    str: String?;
    number: Int?;
    flag: Bool?;
}

contract TestContract {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            inner: Inner{
                str: null,
                number: null,
                flag: null
            }
        };
    }
}