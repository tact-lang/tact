struct DeepStruct {
    num: Int;
    boolVal: Bool;
    txt: String;
}

struct OuterStruct {
    inner: DeepStruct;
    flag: Bool;
}

contract NestedStructTest {
    stored: OuterStruct;

    init() {
        self.stored = OuterStruct{
            inner: DeepStruct{
                num: 1,
                boolVal: true,
                txt: "abc",
            },
            flag: false,
        };
    }
}