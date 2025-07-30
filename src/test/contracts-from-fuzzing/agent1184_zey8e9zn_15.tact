struct IntStringBool {
    i: Int;
    s: String;
    b: Bool;
}

contract ThreePrimitives {
    data: IntStringBool;

    init() {
        self.data = IntStringBool{
            i: 123,
            s: "hi",
            b: true
        };
    }
}