// Persistent storage struct with many nested optionals of primitive types
struct DeepOptional {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
}

struct ContainsManyOptional {
    opt1: DeepOptional?;
    opt2: DeepOptional?;
    opt3: DeepOptional?;
}

contract BigOptionalNest {
    data: ContainsManyOptional;

    init() {
        self.data = ContainsManyOptional{
            opt1: null,
            opt2: null,
            opt3: null
        };
    }
}