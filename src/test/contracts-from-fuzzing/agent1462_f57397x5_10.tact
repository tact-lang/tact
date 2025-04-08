struct Layer3 {
    x: Int;
}

struct Layer2 {
    x: Layer3?;
}

struct Layer1 {
    x: Layer2?;
}

contract NestOpt {
    value: Layer1?;
    init() {
        self.value = Layer1{ x: Layer2{ x: Layer3{ x: 10 } } };
    }
}