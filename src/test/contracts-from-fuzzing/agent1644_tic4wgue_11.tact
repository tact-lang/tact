struct InnerOpt {
    foo: Int?;
    bar: String?;
}

struct HasOptionalStruct {
    inner: InnerOpt?;
    label: String;
}

contract TestContract {
    data: HasOptionalStruct;

    init() {
        self.data = HasOptionalStruct{
            inner: null,
            label: "Init"
        };
    }
}