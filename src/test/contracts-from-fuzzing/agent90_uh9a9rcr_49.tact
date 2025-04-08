struct ManyLayers {
    l1: Layer1;
}

struct Layer1 {
    l2: Layer2;
}

struct Layer2 {
    l3: Layer3;
}

struct Layer3 {
    l4: Layer4;
}

struct Layer4 {
    l5: Layer5;
}

struct Layer5 {
    x: Int;
    y: Bool;
}

contract ManyLayersContract {
    data: ManyLayers;
    init() {
        self.data = ManyLayers{
            l1: Layer1{ l2: Layer2{ l3: Layer3{ l4: Layer4{ l5: Layer5{ x:1, y:true } } } } }
        };
    }
}