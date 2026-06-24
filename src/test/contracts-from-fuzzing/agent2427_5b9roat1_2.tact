struct DeepNested3 {
    z: Int;
}

struct DeepNested2 {
    y: DeepNested3;
}

struct DeepNested1 {
    x: DeepNested2;
}

contract DeepNestContract {
    data: DeepNested1;

    init() {
        self.data = DeepNested1{
            x: DeepNested2{
                y: DeepNested3{
                    z: 42
                }
            }
        };
    }
}
