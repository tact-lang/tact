struct A {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            intVal: 42,
            boolVal: true,
            strVal: "hello",
            optInt: null,
            optBool: false
        };
    }
}
