struct Layer1 { x: Int }
struct Layer2 { l1: Layer1? }
struct Layer3 { l2: Layer2? }
struct Layer4 { l3: Layer3? }
struct Layer5 { l4: Layer4? }

contract CrazyDeepOptional {
    d: Layer5;
    init() {
        self.d = Layer5{ l4: null };
    }
}