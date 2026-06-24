struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    a: Int;
    b: String;
    c: Bool?;
}

contract TestContract {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            inner: InnerStruct{
                a: 5,
                b: "test",
                c: true
            }
        };
    }
}