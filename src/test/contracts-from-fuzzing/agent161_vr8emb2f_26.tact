struct DeepWell {
    a: Layer1;
}

struct Layer1 {
    b: Layer2;
    c: Bool?;
}

struct Layer2 {
    d: Layer3;
    e: String;
}

struct Layer3 {
    f: Layer4;
}

struct Layer4 {
    g: Int;
    h: String?;
}

contract DeepWellTest {
    data: DeepWell;
    init() {
        self.data = DeepWell{
            a: Layer1{
                b: Layer2{
                    d: Layer3{
                        f: Layer4{
                            g: 99,
                            h: null,
                        },
                    },
                    e: "layer2",
                },
                c: true,
            },
        };
    }
}
