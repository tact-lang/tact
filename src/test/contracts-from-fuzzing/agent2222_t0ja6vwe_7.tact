struct Layer5 { a: Int; }
struct Layer4 { l5: Layer5; }
struct Layer3 { l4: Layer4; }
struct Layer2 { l3: Layer3; }
struct Layer1 { l2: Layer2; }

contract TestContract {
    data: Layer1;
    init() {
        self.data = Layer1{ l2: Layer2{ l3: Layer3{ l4: Layer4{ l5: Layer5{ a: 123 } } } } };
    }
}