struct StringsBoolsInts {
    s: String;
    b: Bool;
    i: Int;
}

contract ComboOrder {
    data: StringsBoolsInts = StringsBoolsInts{
        s: "hello", b: true, i: 42
    };

    init() {
        self.data = StringsBoolsInts{
            s: "bye", b: false, i: 100
        };
    }
}