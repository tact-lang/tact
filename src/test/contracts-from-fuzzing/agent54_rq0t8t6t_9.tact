struct PrimitiveStorage {
    x: Int;
    y: Bool;
    z: String;
}

contract PrimitiveContract {
    data: PrimitiveStorage;

    init() {
        self.data = PrimitiveStorage{
            x: 42,
            y: true,
            z: "hello"
        };
    }
}