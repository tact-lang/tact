// deeply optional inside optional struct
struct InnerStruct {
    val1: Int;
    val2: Bool;
}

struct OuterStruct {
    inner: InnerStruct?;
    flag: Bool;
}

contract DeepOptional {
    os: OuterStruct?;

    init() {
        self.os = null;
    }
}