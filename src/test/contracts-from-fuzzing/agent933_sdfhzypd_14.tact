struct NestedStructInsideOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract Test {
    val: NestedStructInsideOptional;
    init() {
        self.val = NestedStructInsideOptional{ inner: InnerStruct{ x:1, y:true } };
    }
}