struct Layer2 {
    innermost: Int;
}

struct Layer1 {
    maybeLayer2: Layer2?;
}

contract OptionalDeepLayerContract {
    nested: Layer1;

    init() {
        self.nested = Layer1{
            maybeLayer2: Layer2{ innermost: 55 }
        };
    }
}