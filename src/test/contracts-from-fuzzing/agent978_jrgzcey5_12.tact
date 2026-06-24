// very deeply nested optional in contract state with some non-optional wrapper layers
struct L1 { x: Int?; }
struct L2 { l1: L1?; }
struct L3 { l2: L2; }
struct L4 { l3: L3?; }

contract DeeplyNestedOptionals {
    l4: L4;

    init() {
        self.l4 = L4{
            l3: null
        };
    }
}