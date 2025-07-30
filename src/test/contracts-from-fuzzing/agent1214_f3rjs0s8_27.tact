struct Inner {
    val: Int;
    title: String;
}

struct Wrapper {
    data: Inner;
}

contract StructChain {
    wrap: Wrapper;
    init() {
        self.wrap = Wrapper{ data: Inner{ val: 77, title: "nested" } };
    }
}