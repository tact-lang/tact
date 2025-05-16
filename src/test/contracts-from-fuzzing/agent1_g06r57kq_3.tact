struct Complex {
    mapField: map<Int, Int>;
    optField: Bool?;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            mapField: emptyMap(),
            optField: null
        };
    }
}