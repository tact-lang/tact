contract SingleNestedOptional {
    data: Inner?;

    init() {
        self.data = null;
    }
}

struct Inner {
    val: Int;
}