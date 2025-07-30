struct InnerStruct {
    val1: Int;
    val2: Bool;
}

struct OuterOpt {
    inner: InnerStruct?;
}

contract OptStructField {
    persist: OuterOpt;
    init() {
        self.persist = OuterOpt {
            inner: InnerStruct { val1: 5, val2: true }
        };
    }
}
