struct DeepOptional1 {
    x: Int?;
}

struct DeepOptional2 {
    y: DeepOptional1?;
}

struct DeepOptional3 {
    z: DeepOptional2?;
}

contract OptionalLevels {
    deep: DeepOptional3;

    init() {
        self.deep = DeepOptional3{
            z: null
        };
    }
}