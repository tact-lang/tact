struct Layer3 {
    f: Int;
}

struct Layer2 {
    nested: Layer3;
}

struct Layer1 {
    nested: Layer2;
}

contract ModifyInnerAfterInit {
    inner: Layer1;

    init() {
        self.inner = Layer1{
            nested: Layer2{
                nested: Layer3{
                    f: 100
                }
            }
        };
    }

    receive() {
        let copy = self.inner;
        let newStruct = Layer3{f: 200};
        self.inner = Layer1{
            nested: Layer2{
                nested: newStruct
            }
        };
    }
}