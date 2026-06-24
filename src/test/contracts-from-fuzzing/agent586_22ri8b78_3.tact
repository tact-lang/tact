struct OptNested {
    inner: Inner?;
}

struct Inner {
    val: Int?;
}

contract OptContract {
    field: OptNested;

    init() {
        self.field = OptNested{
            inner: Inner{
                val: null
            }
        };
    }
}