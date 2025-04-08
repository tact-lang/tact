struct CombiningAll {
    amount: Int;
    sender: Address;
    info: InnerInfo;
}

struct InnerInfo {
    flag: Bool;
    note: String;
    extra: DeepInner?;
}

struct DeepInner {
    detail: String;
    code: Int;
}

contract ComplexNestedTest {
    data: CombiningAll;

    init() {
        self.data = CombiningAll{
            amount: 1,
            sender: myAddress(),
            info: InnerInfo{flag: true, note: "n", extra: null}
        };
    }

    receive() {
        self.data = CombiningAll{
            amount: 2,
            sender: myAddress(),
            info: InnerInfo{flag: false, note: "m", extra: DeepInner{detail: "d", code: 42}}
        };
    }
}