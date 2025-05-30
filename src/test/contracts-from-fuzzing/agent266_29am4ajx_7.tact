struct DeepNest3 {
    z: Bool;
}

struct DeepNest2 {
    y: DeepNest3;
}

struct DeepNest1 {
    x: DeepNest2;
}

contract DeepNestContract {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            x: DeepNest2{
                y: DeepNest3{
                    z: true
                }
            }
        };
    }
}