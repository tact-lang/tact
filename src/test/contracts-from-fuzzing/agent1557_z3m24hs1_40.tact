// Optional inner struct inside optional outer struct
struct InnerOpt {
    a: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptStructInOptStruct {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{ inner: null };
    }
}