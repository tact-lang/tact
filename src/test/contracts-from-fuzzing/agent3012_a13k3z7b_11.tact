struct WrapStringOpt {
    val: String?;
}

struct WrapOptionalStruct {
    inner: WrapStringOpt?;
}

contract WrappedOptionals {
    data: WrapOptionalStruct;

    init() {
        self.data = WrapOptionalStruct{
            inner: null
        };
    }
}