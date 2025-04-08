struct Innermost { x: Int; }
struct InnerOpt {
    inner: Innermost?;
}
contract OptOptField {
    opt: InnerOpt?;
    init() {
        self.opt = null;
    }
}