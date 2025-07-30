struct VariousTypes {
    foo: Int;
    bar: Bool;
    baz: String;
    qux: Int?;
    quux: Bool?;
    corge: String?;
}

contract MixContract {
    data: VariousTypes;

    init() {
        self.data = VariousTypes{
            foo: 10,
            bar: true,
            baz: "abc",
            qux: 1,
            quux: false,
            corge: "def",
        };
    }
}