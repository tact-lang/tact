// Optional of struct with optional field inside
struct InnerOpt {
    val: Int?;
}

contract TestContract {
    s: InnerOpt?;

    init() {
        self.s = InnerOpt{val: 42};
    }

    receive() {
        let sval = self.s;
        if (sval != null) {
            let _ = sval!!.val;
        }
    }
}