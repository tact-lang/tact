struct Inner {
    val1: Int;
    val2: String?;
    val3: Address?;
}

struct ComplexStruct {
    inner: Inner;
    flag: Bool;
    note: String?;
}

contract ComplexTester {
    data: ComplexStruct?;

    init() {
        self.data = ComplexStruct{
            inner: Inner{
                val1: 42,
                val2: "nested",
                val3: null,
            },
            flag: true,
            note: null,
        };
    }
}