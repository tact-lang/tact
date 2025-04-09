struct MultiLevel {
    inner1: Int?;
    inner2: InnerStruct?;
}

struct InnerStruct {
    y: Int;
    z: String?;
}

contract ComplexOptionals {
    val: MultiLevel;

    init() {
        self.val = MultiLevel{
            inner1: null,
            inner2: null,
        };
    }
}