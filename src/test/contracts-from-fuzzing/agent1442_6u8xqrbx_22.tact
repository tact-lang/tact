// edge: nested struct with both optionals and nested optional struct
struct DeepOpt {
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract TestContract {
    state: DeepOpt;
    init() {
        self.state = DeepOpt{inner: null};
    }
}