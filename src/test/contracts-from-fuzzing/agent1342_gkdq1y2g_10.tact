struct Inner {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
}

contract MultiFieldPersistent {
    x: Int = 0;
    y: Bool = false;
    z: String = "";
    inner: Inner;

    init() {
        self.inner = Inner{
            intVal: 1,
            boolVal: true,
            strVal: "test"
        };
    }
}