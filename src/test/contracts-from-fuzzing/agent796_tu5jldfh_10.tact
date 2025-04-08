// Deeply nested optionals inside a struct inside contract storage
struct DeepOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Outer {
    info: DeepOpt?;
    n: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            info: null,
            n: 0
        };
    }
}