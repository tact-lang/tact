struct InnerNested {
    val1: Int;
    val2: Bool?;
}

struct OuterNested {
    inner: InnerNested;
    val3: String;
}

contract TestContract {
    persistentStruct: OuterNested;
    
    init() {
        self.persistentStruct = OuterNested{
            inner: InnerNested{
                val1: 42,
                val2: true,
            },
            val3: "test",
        };
    }
}