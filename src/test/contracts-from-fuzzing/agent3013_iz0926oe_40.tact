struct DS {
    a: Int;
}

struct DSO {
    inner: DS?;
}

contract DeepStructOpt {
    val: DSO?;

    init() {
        self.val = null;
    }
}
