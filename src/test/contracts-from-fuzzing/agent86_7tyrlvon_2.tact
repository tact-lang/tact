struct Inner {
    intVal: Int;
    strVal: String;
    boolVal: Bool;
}

contract MultiType {
    innerStored: Inner;

    init() {
        self.innerStored = Inner{
            intVal: 42,
            strVal: "hello",
            boolVal: true
        };
    }
}