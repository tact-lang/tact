struct MultipleLayers {
    one: Int;
    two: Layer1;
}

struct Layer1 {
    flag: Bool;
    nested: Layer2;
}

struct Layer2 {
    desc: String;
    addr: Address;
}

contract MultiLayerTest {
    data: MultipleLayers;

    init() {
        self.data = MultipleLayers{
            one:1,
            two: Layer1{
                flag: true,
                nested: Layer2{
                    desc: "desc",
                    addr: myAddress(),
                }
            }
        };
    }
}