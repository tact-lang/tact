// Struct - optional with nested Struct initialized null
struct OtherStruct {
    n: Int;
}

struct TestOptional {
    field: OtherStruct?;
}

contract OptStruct {
    s: TestOptional;
    init() {
        self.s = TestOptional{ field: null };
    }
}