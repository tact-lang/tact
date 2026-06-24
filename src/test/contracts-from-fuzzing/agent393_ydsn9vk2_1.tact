struct SingleLayer {
    intField: Int;
    boolField: Bool;
    strField: String;
}

contract Test {
    data: SingleLayer = SingleLayer{
        intField: 0,
        boolField: false,
        strField: "",
    };

    init() {
        self.data = SingleLayer{
            intField: 1,
            boolField: true,
            strField: "hello",
        };
    }
}