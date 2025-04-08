struct OptionalNested {
    inner: DeepStruct?;
}

struct DeepStruct {
    num: Int;
    flag: Bool;
}

contract ContractWithOptionalNested {
    st: OptionalNested;

    init() {
        self.st = OptionalNested{
            inner: DeepStruct{
                num: 9,
                flag: true,
            },
        };
    }
}