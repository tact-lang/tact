struct DeepNest3 {
    z: Int;
}

struct DeepNest2 {
    y: DeepNest3;
    yn: Int?;
}

struct DeepNest1 {
    x: DeepNest2;
}

contract TestContract {
    data: DeepNest1;
    init() {
        self.data = DeepNest1{
            x: DeepNest2{
                y: DeepNest3{z: 123},
                yn: null
            }
        };
    }
}