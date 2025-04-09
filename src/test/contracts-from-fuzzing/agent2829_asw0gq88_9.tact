struct InnerOpt {
    foo: Int;
}

struct Wrapper {
    maybe: InnerOpt?;
    val: Int;
}

contract StorageOptionalStruct {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            maybe: InnerOpt{ foo: 123 },
            val: 42,
        };
    }
}
