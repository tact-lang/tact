struct Deep {
    a: Int?;
    b: Bool?;
}

struct Container {
    deep: Deep;
    message: String;
}

contract DeepOptionalStorage {
    stuff: Container = Container{
        deep: Deep{ a: null, b: true },
        message: "hello"
    };

    init() {
        self.stuff = Container{
            deep: Deep{ a: 123, b: null },
            message: "world"
        };
    }
}