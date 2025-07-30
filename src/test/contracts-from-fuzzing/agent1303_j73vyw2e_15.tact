struct N1 { x: Int?; }
struct N2 { n1: N1?; }
struct N3 { n2: N2?; }
struct N4 { n3: N3?; }
struct N5 { n4: N4?; }

contract TestContract {
    deeplyOptional: N5;

    init() {
        self.deeplyOptional = N5{
            n4: null
        };
    }
}