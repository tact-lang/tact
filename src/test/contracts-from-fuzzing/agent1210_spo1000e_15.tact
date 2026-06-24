struct OptStruct1 { a: Int?; }
struct OptStruct2 { b: OptStruct1?; }

contract OptionalNestedStructs {
    data: OptStruct2;
    init() {
        self.data = OptStruct2 { b: null };
    }
}