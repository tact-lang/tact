struct BoolLayer1 {
    b1: Bool;
}
struct BoolLayer2 {
    b2: BoolLayer1;
}
struct BoolLayer3 {
    b3: BoolLayer2;
}

contract DeepBoolNestTest {
    data: BoolLayer3;

    init() {
        self.data = BoolLayer3{b3: BoolLayer2{b2: BoolLayer1{b1:true}}};
    }
}