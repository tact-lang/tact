struct Layer1 {
    a: Int;
    b: Bool;
    c: String;
}

struct Layer2 {
    l1: Layer1;
    flag: Bool;
}

struct Layer3 {
    l2: Layer2;
    s: String;
}

contract MultiLayerStructContract {
    stor: Layer3;
    
    init() {
        self.stor = Layer3{
            l2: Layer2{
                l1: Layer1{
                    a: 1,
                    b: true,
                    c: "deep",
                },
                flag: false,
            },
            s: "top",
        };
    }
}