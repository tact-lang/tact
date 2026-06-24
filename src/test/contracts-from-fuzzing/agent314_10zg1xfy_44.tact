// optional that wraps struct, which contains field that is optional struct
struct InOpt {
    val: Int;
}
contract OptWrapper {
    innerOpt: InOpt?;
    wrapOpt: OptWrapper2?;
    init() {
        self.innerOpt = null;
        self.wrapOpt = null;
    }
}

struct OptWrapper2 {
    x: Bool;
}