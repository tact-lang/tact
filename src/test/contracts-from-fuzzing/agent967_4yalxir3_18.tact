struct DeepRec1 { next: DeepRec2; }
struct DeepRec2 { next: DeepRec3; }
struct DeepRec3 { next: DeepRec4; }
struct DeepRec4 { val: Int; }

contract RecursionDepthTest {
    s: DeepRec1;

    init() {
        self.s = DeepRec1{next: DeepRec2{next: DeepRec3{next: DeepRec4{val: 9}}}};
    }
}