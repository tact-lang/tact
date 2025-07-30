struct Layer3 {
    z: Int;
}
struct Layer2 {
    y1: Layer3;
    y2: Layer3;
}
struct Layer1 {
    x1: Layer2;
    x2: Layer2;
}

contract TestContract {
    nested: Layer1;
    
    init() {
        self.nested = Layer1{
            x1: Layer2{
                y1: Layer3{z:1}, y2: Layer3{z:2}
            },
            x2: Layer2{
                y1: Layer3{z:3}, y2: Layer3{z:4}
            }
        };
    }
}