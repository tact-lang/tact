struct InnerBool {
    b: Bool;
}

struct InnerInt {
    i: Int;
}

contract DifferentNestedStructs {
    bWrap: InnerBool;
    iWrap: InnerInt;

    init() {
        self.bWrap = InnerBool{b:true};
        self.iWrap = InnerInt{i:42};
    }
}