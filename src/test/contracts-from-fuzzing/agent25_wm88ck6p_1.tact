struct Inner {
    intField: Int;
    boolField: Bool;
    strField: String;
}

contract TestContract {
    data: Inner;
    
    init() {
        self.data = Inner{
            intField: 1,
            boolField: true,
            strField: "hello",
        };
    }
}