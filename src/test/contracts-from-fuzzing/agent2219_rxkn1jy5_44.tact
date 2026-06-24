struct Layer1 { f: Int; }
struct Layer2 { l1: Layer1; }
struct Layer3 { l2: Layer2; }
struct Layer4 { l3: Layer3; }
struct Layer5 { l4: Layer4; }

contract VeryDeep {
    top: Layer5;

    init() {
        self.top = Layer5{ l4: Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ f: 777 } } } } };
    }
}