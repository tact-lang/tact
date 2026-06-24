struct Layer1 {
    a: Int;
    b: Bool;
}

struct Layer2 {
    x: Layer1;
    y: Bool?;
}

struct Layer3 {
    nested: Layer2;
    z: Int?;
}

contract TestContract {
    deep: Layer3;

    init() {
        self.deep = Layer3{
            nested: Layer2{
                x: Layer1{
                    a: 11,
                    b: false,
                },
                y: null,
            },
            z: null,
        };
    }
}