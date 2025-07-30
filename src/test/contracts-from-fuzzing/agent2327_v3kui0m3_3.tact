struct Layer3 {
    leaf1: Int;
    leaf2: Bool;
    leaf3: String;
}

struct Layer2 {
    sub1: Layer3;
    sub2: Layer3;
}

struct Layer1 {
    inner: Layer2;
}

contract NestedStruct {
    storage: Layer1;

    init() {
        self.storage = Layer1{
            inner: Layer2{
                sub1: Layer3{leaf1:1, leaf2:true, leaf3:"a"},
                sub2: Layer3{leaf1:2, leaf2:false, leaf3:"b"}
            }
        };
    }
}
