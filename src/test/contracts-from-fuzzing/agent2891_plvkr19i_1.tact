struct Layer1 {
    x: Int;
    y: Int;
}

struct Layer2 {
    l1: Layer1;
    z: Int?;
}

struct Layer3 {
    l2: Layer2;
    label: String;
}

contract DeepNestTest {
    data: Layer3;

    init() {
        self.data = Layer3{
            l2: Layer2{
                l1: Layer1{ x:1, y:2 },
                z: null
            },
            label: "nest"
        };
    }
}