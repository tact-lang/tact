struct DeepOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    a: DeepOpt?;
    b: DeepOpt?;
    c: DeepOpt?;
}

contract TestContract {
    var: Container;

    init() {
        self.var = Container{
            a: null,
            b: DeepOpt{ x: 1, y: true, z: "foo" },
            c: null,
        };
    }
}