struct Layer1 {
    value: Int;
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

struct Layer5 {
    nested: Layer4;
}

contract FiveLayers {
    deepVal: Layer5;

    init() {
        self.deepVal = Layer5{
            nested: Layer4{
                nested: Layer3{
                    nested: Layer2{
                        nested: Layer1{value: 77}
                    }
                }
            }
        };
    }
}