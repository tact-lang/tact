// Testing optional DeepInner inside nested structs
struct DeepInner {
    v: Int?;
}

struct MidWrap {
    inner: DeepInner?;
}

contract TestContract {
    data: MidWrap;

    init() {
        self.data = MidWrap{
            inner: DeepInner{v: 5}
        };
    }

    receive() {}
}