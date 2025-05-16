struct DefaultDeepNested {
    a: AStruct;
}

struct AStruct {
    b: BStruct;
}

struct BStruct {
    c: Int = 12;
    d: Bool = false;
}

contract TestContract {
    data: DefaultDeepNested;

    init() {
        self.data = DefaultDeepNested{
            a: AStruct{
                b: BStruct{}
            }
        };
    }
}