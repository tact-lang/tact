struct DeeplyNested {
    x: Layer1;
}

struct Layer1 {
    y: Layer2;
}

struct Layer2 {
    z: Layer3;
}

struct Layer3 {
    someInt: Int;
    someBool: Bool;
}

contract TestDeepChain {
    val: DeeplyNested;

    init() {
        self.val = DeeplyNested{
            x: Layer1{ y: Layer2{ z: Layer3{ someInt: 99, someBool: true } } }
        };
    }
}