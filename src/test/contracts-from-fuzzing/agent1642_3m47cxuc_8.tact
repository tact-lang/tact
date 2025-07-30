struct NestedStruct1 { a: Int; }
struct NestedStruct2 { b: NestedStruct1; }
struct NestedStruct3 { c: NestedStruct2; }

contract OptionalDeepStruct {
    nestedOpt: NestedStruct3?;

    init() {
        self.nestedOpt = null;
    }
}