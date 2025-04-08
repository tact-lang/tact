struct DeepOptional {
    x: Int?;
    y: Bool?;
    s: String?;
}

struct Container {
    val: DeepOptional;
    another: Int;
}

contract OptionalNested {
    cont: Container;

    init() {
        self.cont = Container{
            val: DeepOptional{x:null, y:null, s:null},
            another: 5
        };
    }
}