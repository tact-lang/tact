struct Layer1 {
    num: Int = 2;
}

struct Layer2 {
    inner: Layer1;
    text: String = "abc";
}

struct Layer3 {
    ref2: Layer2;
    flag: Bool = true;
}

contract Test {
    l3: Layer3;

    init() {
        self.l3 = Layer3{
            ref2: Layer2{
                inner: Layer1{
                    num: 4
                },
                text: "deep"
            },
            flag: false
        };
    }
}
