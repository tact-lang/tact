struct DeepOptionalWrap {
    inner: Wrapper?;
    note: String;
}

contract DeepOptional {
    f: DeepOptionalWrap;

    init() {
        self.f = DeepOptionalWrap{
            inner: Wrapper{
                str: "hi",
                addr: myAddress(),
                intv: 33,
                flag: false
            },
            note: "tester"
        };
    }
}

struct Wrapper {
    str: String;
    addr: Address;
    intv: Int;
    flag: Bool;
}