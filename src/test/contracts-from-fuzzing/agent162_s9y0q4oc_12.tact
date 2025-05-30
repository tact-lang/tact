struct Layer3 {
    a: Int;
    b: String;
}

struct Layer2 {
    inside: Layer3;
    flag: Bool;
}

struct Layer1 {
    middle: Layer2;
    num: Int;
}

contract DeepLayers {
    data: Layer1;

    init() {
        self.data = Layer1{
            middle: Layer2{
                inside: Layer3{
                    a: 10,
                    b: "deep"
                },
                flag: true
            },
            num: 5
        };
    }
}