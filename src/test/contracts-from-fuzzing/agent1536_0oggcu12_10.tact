struct Layer1 {
    a: Int;
    b: Layer2;
    c: Int?;
}

struct Layer2 {
    d: Int;
    e: Layer3;
    f: Bool?;
}

struct Layer3 {
    g: Int;
    h: String?;
}

contract NestedLayers {
    myData: Layer1;

    init() {
        self.myData = Layer1{
            a: 10,
            b: Layer2{
                d: 20,
                e: Layer3{ g: 30, h: "hello" },
                f: null
            },
            c: null
        };
    }
}