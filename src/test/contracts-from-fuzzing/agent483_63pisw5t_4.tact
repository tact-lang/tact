struct DeepNest3 {
    z: Int;
}

struct DeepNest2 {
    y: Bool;
    inner: DeepNest3;
}

struct DeepNest1 {
    x: String;
    inner: DeepNest2;
}

contract DeepNested {
    data: DeepNest1;

    init() {
        self.data = DeepNest1{
            x: "hi",
            inner: DeepNest2{
                y: true,
                inner: DeepNest3{
                    z: 123
                },
            },
        };
    }
}
