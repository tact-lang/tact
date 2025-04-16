struct StringBool {
    s: String;
    b: Bool;
}

struct Container {
    inner: StringBool;
    flag: Bool;
    val: Int;
}

contract MixedFields {
    field: Container;

    init() {
        self.field = Container{
            inner: StringBool{ s: "x", b: true },
            flag: false,
            val: 777,
        };
    }
}
