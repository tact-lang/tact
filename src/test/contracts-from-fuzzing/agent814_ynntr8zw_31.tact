// struct nesting a struct with default, opt wrapping of that
struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int = 7;
    s: String?;
}

contract DefAndOptNest {
    field: DeepOpt;

    init() {
        self.field = DeepOpt{
            inner: InnerOpt{
                val: 55,
                s: null,
            }
        };
    }
}