struct NestedStruct {
    inner1: Int;
    inner2: String;
    inner3: Bool;
}
contract StructFieldDefault {
    rec: NestedStruct = NestedStruct {
        inner1: 1,
        inner2: "hi",
        inner3: true
    };
    init() {
        self.rec = NestedStruct {
            inner1: 2,
            inner2: "test",
            inner3: false
        };
    }
}