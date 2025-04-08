struct Layer3 {
    x: Int as int32;
    y: Int as uint16;
}

struct Layer2 {
    data: Layer3;
    b: Bool;
    str: String;
}

struct Layer1 {
    a: Int as coins;
    nested: Layer2;
}

contract TestContract {
    complex: Layer1;

    init() {
        self.complex = Layer1{
            a: 9999,
            nested: Layer2{
                data: Layer3{x: -1234, y: 5678},
                b: false,
                str: "multi"
            }
        };
    }
}
