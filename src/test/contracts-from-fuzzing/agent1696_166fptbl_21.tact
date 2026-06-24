struct SubStruct {
    x: Int;
}

struct OuterOpt {
    inner: SubStruct?;
    num: Int?;
}

contract NestedOptionalStructTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: null,
            num: 55
        };
    }
}