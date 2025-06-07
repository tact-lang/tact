struct DeepNest {
    layer1: Inner1;
}

struct Inner1 {
    layer2: Inner2;
}

struct Inner2 {
    layer3: Inner3;
}

struct Inner3 {
    layer4: Inner4;
}

struct Inner4 {
    val: Int;
}

contract TestContract {
    val: DeepNest;
    
    init() {
        self.val = DeepNest{
            layer1: Inner1{
                layer2: Inner2{
                    layer3: Inner3{
                        layer4: Inner4{ val: 123 }
                    }
                }
            }
        };
    }
}
