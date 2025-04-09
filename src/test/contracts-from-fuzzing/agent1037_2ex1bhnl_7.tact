struct NestedDefaults {
    n1: InnerStruct;
}

struct InnerStruct {
    val1: Int = 7;
    val2: Bool = false;
    val3: String = "hi";
}

contract TestContract {
    data: NestedDefaults;

    init() {
        self.data = NestedDefaults{
            n1: InnerStruct{}
        };
    }
}