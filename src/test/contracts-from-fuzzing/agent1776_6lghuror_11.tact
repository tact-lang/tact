// Testing whether optional chaining is fully supported
struct InnerMost {
    a: Int = 1;
    b: Bool = true;
    c: String?;
}

struct DeepWrap {
    inner: InnerMost = InnerMost{a: 5, b: false, c: "z"};
    text: String = "x";
    flag: Bool?;
}

struct OuterWrap {
    wrap: DeepWrap?;
    count: Int = 100;
}

contract TestContract {
    monster: OuterWrap;

    init() {
        self.monster = OuterWrap{
            wrap: DeepWrap{
                inner: InnerMost{a: 99, b: true, c: "hey"},
                text: "deep",
                flag: false
            },
            count: 42
        };
    }

    receive() {
        let optWrap = self.monster.wrap;
        if (optWrap != null) {
            let _ = optWrap!!.inner.c;
        }
    }
}