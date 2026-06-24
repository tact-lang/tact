struct Layer3 {
    x: Int;
    y: Bool?;
    name: String;
}

struct Layer2 {
    inner: Layer3;
}

struct Layer1 {
    maybeInner: Layer2?;
}

contract TestContract {
    data: Layer1;

    init() {
        self.data = Layer1{
            maybeInner: Layer2{
                inner: Layer3{
                    x: 123,
                    y: null,
                    name: "deep"
                }
            }
        };
    }
}