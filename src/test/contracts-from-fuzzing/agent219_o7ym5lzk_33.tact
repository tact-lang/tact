struct Layer1 {
    a: Int;
    b: Bool;
}

struct Layer2 {
    l1: Layer1;
    c: String;
}

struct Layer3 {
    l2: Layer2;
    d: Bool?;
}

struct Layer4 {
    l3: Layer3;
    e: Int?;
}

contract DeepFourLayers {
    data: Layer4;

    init() {
        self.data = Layer4{
            l3: Layer3{
                l2: Layer2{
                    l1: Layer1{
                        a: 7,
                        b: true
                    },
                    c: "hi"
                },
                d: false
            },
            e: null
        };
    }
}