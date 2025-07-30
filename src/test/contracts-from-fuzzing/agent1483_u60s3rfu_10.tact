struct RecStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
}

contract RecursiveOptionals {
    storage: RecStruct?;

    init() {
        self.storage = null;
    }
}