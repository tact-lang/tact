struct InnerStruct {
    val1: Int;
    val2: Bool;
}

contract TestContract {
    s: InnerStruct;

    init() {
        self.s = InnerStruct{
            val1: 42,
            val2: true,
        };
    }
}