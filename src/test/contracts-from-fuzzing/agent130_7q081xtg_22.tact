// Struct with nested structs and mixed optional/required composite fields
struct DeepOpt {
    foo: Int?;
    bar: Bool?;
}

struct InnerOpt {
    s: String = "";
    deep: DeepOpt?;
}

struct OuterNest {
    txt: String?;
    inner: InnerOpt;
}

contract TestContract {
    state: OuterNest;

    init() {
        self.state = OuterNest{
            txt: null,
            inner: InnerOpt{
                s: "hello",
                deep: DeepOpt{ foo: null, bar: true }
            }
        };
    }

    receive() {
        self.state = self.state;
    }
}