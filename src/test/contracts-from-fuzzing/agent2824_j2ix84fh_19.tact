struct InnerMost { z: Int }
struct Layer3 { y: InnerMost }
struct Layer2 { x: Layer3? }

contract OptionalMidNested {
    data: Layer2;

    init() {
        self.data = Layer2{ x: null };
    }
}