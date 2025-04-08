struct DeepOptional {
    i: Int?;
    s: String?;
    b: Bool?;
}

struct Container {
    val: DeepOptional?;
}

contract Test {
    cont: Container;

    init() {
        self.cont = Container{
            val: DeepOptional{
                i: 42,
                s: null,
                b: true,
            }
        };
    }
}
