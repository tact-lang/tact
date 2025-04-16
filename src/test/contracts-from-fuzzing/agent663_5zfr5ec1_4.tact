struct NestedOptionalStruct {
    inner: Int?;
    another: Bool;
}

struct Wrapper {
    content: NestedOptionalStruct;
    flag: Bool;
}

contract NestedOptionalStructTest {
    s: Wrapper;

    init() {
        self.s = Wrapper{
            content: NestedOptionalStruct{
                inner: null,
                another: true
            },
            flag: false
        };
    }
}