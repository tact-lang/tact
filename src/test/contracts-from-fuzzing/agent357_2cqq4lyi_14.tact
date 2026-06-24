struct Layer1 {
    val: Int;
}

struct Layer2 {
    nested: Layer1;
}

struct Layer3 {
    nested: Layer2;
}

struct Layer4 {
    nested: Layer3;
}

contract FourLayers {
    data: Layer4;

    init() {
        self.data = Layer4{
            nested: Layer3{
                nested: Layer2{
                    nested: Layer1{
                        val: 123,
                    },
                },
            },
        };
    }
}