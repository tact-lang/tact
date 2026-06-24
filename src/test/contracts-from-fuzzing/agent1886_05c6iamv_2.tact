struct DeepNested1 {
    a: Int;
}

struct DeepNested2 {
    b: DeepNested1;
}

struct DeepNested3 {
    c: DeepNested2;
}

contract TestDeepNested {
    data: DeepNested3;

    init() {
        self.data = DeepNested3{
            c: DeepNested2{
                b: DeepNested1{
                    a: 42
                }
            }
        };
    }
}