struct DeepNest {
    x: Inner1;
}

struct Inner1 {
    y: Inner2;
}

struct Inner2 {
    z: String;
}

contract DeepContract {
    field: DeepNest;

    init() {
        self.field = DeepNest{
            x: Inner1{
                y: Inner2{
                    z: "hello"
                }
            }
        };
    }
}