struct Layer3 {
    x: Int;
    y: String?;
}

struct Layer2 {
    l3a: Layer3;
    l3b: Layer3;
}

struct Layer1 {
    l2: Layer2;
    more: Int;
}

contract MultiLayer {
    storage: Layer1;

    init() {
        self.storage = Layer1{
            l2: Layer2{
                l3a: Layer3{x:1, y:null},
                l3b: Layer3{x:2, y:null},
            },
            more: 42,
        };
    }
}