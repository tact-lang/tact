struct DeepLayer3 {
    a: String;
}

struct DeepLayer2 {
    nested: DeepLayer3;
}

struct DeepLayer1 {
    nested: DeepLayer2?;
}

contract DeepNullable {
    data: DeepLayer1;

    init() {
        self.data = DeepLayer1{
            nested: null
        };
    }
}