struct Layer1 {
    a: Int;
    b: String;
}

struct Layer2 {
    x: Layer1;
    y: Int;
}

struct Layer3 {
    inner: Layer2;
    flag: Bool;
}

contract CrossNest {
    data: Layer3;

    init() {
        self.data = Layer3{
            inner: Layer2{
                x: Layer1{a:1, b:"b"},
                y: 2,
            },
            flag: true,
        };
    }
}