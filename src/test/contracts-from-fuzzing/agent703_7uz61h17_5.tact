struct DeepOptStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract OptionalNested {
    val: DeepOptStruct;

    init() {
        self.val = DeepOptStruct{
            inner: InnerStruct{
                x: 5,
                y: true,
                z: "hi"
            }
        };
    }
}