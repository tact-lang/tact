struct InnerMost { v: Int; }
struct Inner { val: InnerMost; }

contract OptionalStructField {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}