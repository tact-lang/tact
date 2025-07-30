struct Inner {
    val1: Int;
    val2: Bool?;
}

struct Wrapper {
    nested: Inner;
    optionalNested: Inner?;
    text: String;
    flag: Bool;
}

contract DeepNestedTest {
    data: Wrapper;
    dataOpt: Wrapper?;

    init() {
        self.data = Wrapper{
            nested: Inner{val1: 1, val2: true},
            optionalNested: null,
            text: "hi",
            flag: false
        };
        self.dataOpt = null;
    }
}
