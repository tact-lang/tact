struct Nest {
    a: Int;
}

struct SWithOptStruct {
    nest: Nest?;
    b: Bool;
}

contract OptionalStructField {
    data: SWithOptStruct;
    init() {
        self.data = SWithOptStruct{ nest: null, b: true };
    }
}