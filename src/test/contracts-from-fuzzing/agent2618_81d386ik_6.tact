struct OptDeeper {
    inner: OptInner?;
}

struct OptInner {
    val: Int?;
}

contract OptContract {
    field: OptDeeper;

    init() {
        self.field = OptDeeper{
            inner: OptInner{ val: null }
        };
    }
}