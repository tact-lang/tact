struct DeepOptional {
    s: DeepOptional2?;
}

struct DeepOptional2 {
    s: DeepOptional3?;
}

struct DeepOptional3 {
    x: Int?;
}

contract OptionalDepthTest {
    deep: DeepOptional;

    init() {
        self.deep = DeepOptional{
            s: DeepOptional2{
                s: DeepOptional3{
                    x: null
                }
            }
        };
    }
}
