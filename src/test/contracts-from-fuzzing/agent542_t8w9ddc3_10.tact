struct Layer3 {
    val: Int = 33;
    flag: Bool?;
}

struct Layer2 {
    l3: Layer3;
    name: String = "deep";
}

struct Layer1 {
    l2: Layer2?;
    x: Int?;
}

contract ChainOptionals {
    data: Layer1;

    init() {
        self.data = Layer1{
            l2: Layer2{
                l3: Layer3{
                    val: 123,
                    flag: null
                },
                name: "x"
            },
            x: null
        };
    }
}