struct NestedOpt {
    inner: OptStruct?;
}

struct OptStruct {
    val: Int;
    flag: Bool;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            inner: null
        };
    }
}