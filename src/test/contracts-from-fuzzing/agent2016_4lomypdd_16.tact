struct InnerStruct {
    val1: Int;
    val2: Bool?;
    val3: String;
}

struct Wrapper {
    optInner: InnerStruct?;
    num: Int;
}

contract Test {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            optInner: null,
            num: 17
        };
    }
}