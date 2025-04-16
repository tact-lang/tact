struct StructA {
    x: Int;
}

struct StructB {
    z: StructA?;
    s: String;
}

contract OptionalStructField {
    inner: StructB;

    init() {
        self.inner = StructB{
            z: null,
            s: "test"
        };
    }
}