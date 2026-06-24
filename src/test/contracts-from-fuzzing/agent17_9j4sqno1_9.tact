struct BoolLayer1 { a: Bool; layer2: BoolLayer2; }
struct BoolLayer2 { b: Bool; layer3: BoolLayer3; }
struct BoolLayer3 { c: Bool; }

contract TestBoolChain {
    root: BoolLayer1;

    init() {
        self.root = BoolLayer1{
            a: true,
            layer2: BoolLayer2{
                b: false,
                layer3: BoolLayer3{ c: true }
            }
        };
    }
}