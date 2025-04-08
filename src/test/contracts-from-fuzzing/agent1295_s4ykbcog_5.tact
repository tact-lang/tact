struct DeepNested3 {
    d: Int;
}

struct DeepNested2 {
    c: DeepNested3;
}

struct DeepNested1 {
    b: DeepNested2;
}

contract TestContract {
    a: DeepNested1;

    init() {
        self.a = DeepNested1{
            b: DeepNested2{
                c: DeepNested3{
                    d: 42
                }
            }
        };
    }
}