struct Layer1 {
    a: Int;
    b: String;
}

struct Layer2 {
    inner: Layer1;
}

struct Layer3 {
    inner: Layer2;
}

contract MultiLayerStructStorage {
    val: Layer3;

    init() {
        self.val = Layer3{ inner: Layer2{ inner: Layer1{ a:7, b:"x" } } };
    }
}