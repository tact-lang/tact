struct BoolNest {
    b1: Bool;
    b2: Bool;
    optB1: Bool?;
    optB2: Bool?;
}

struct ContainerBool {
    inner: BoolNest;
}

contract DeepBoolTest {
    nestedBools: ContainerBool;

    init() {
        self.nestedBools = ContainerBool{
            inner: BoolNest{
                b1:true, b2:false, optB1:null, optB2:null
            }
        };
    }
}