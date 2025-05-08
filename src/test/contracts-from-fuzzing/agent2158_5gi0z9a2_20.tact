struct DefaultsAndNesting {
    a: Int = 1;
    b: InnerStruct;
}

struct InnerStruct {
    c: Bool = true;
    d: String = "hi";
}

contract DefaultsNestedTest {
    data: DefaultsAndNesting;

    init() {
        self.data = DefaultsAndNesting{
            b: InnerStruct{}
        };
    }
}