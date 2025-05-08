struct Layer1 { a: Int; }
struct Layer2 { l1: Layer1; }
struct Layer3 { l2: Layer2; }
struct Layer4 { l3: Layer3; }
struct Layer5 { l4: Layer4; }
struct Layer6 { l5: Layer5; }
struct Layer7 { l6: Layer6; }
struct Layer8 { l7: Layer7; }

contract SuperDeep {
    s: Layer8;

    init() {
        self.s = Layer8{ l7: Layer7{ l6: Layer6{ l5: Layer5{ l4: Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ a:1 } } } } } } } };
    }
}
