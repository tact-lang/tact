struct Layer3 {
    value: Int;
}

struct Layer2 {
    nested: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract DeepLayeredContract {
    field: Layer1;

    init() {
        self.field = Layer1{
            nested: Layer2{
                nested: Layer3{ value: 42 }
            }
        };
    }
}