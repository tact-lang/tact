struct Layer3 {
    z: Int;
    s: String?;
}

struct Layer2 {
    y: Layer3;
    flag: Bool;
    text: String;
}

struct Layer1 {
    x: Int;
    nested: Layer2?;
}

contract DeepStructTest {
    field: Layer1;

    init() {
        self.field = Layer1{
            x: 100,
            nested: Layer2{
                y: Layer3{z: 77, s: null},
                flag: true,
                text: "done"
            }
        };
    }
}