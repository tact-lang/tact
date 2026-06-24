struct Nested {
    inner: DeepOptional;
}

struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract TestContract {
    data: Nested;
    
    init() {
        self.data = Nested{
            inner: DeepOptional{
                x: null,
                y: null,
                z: null
            }
        };
    }
}