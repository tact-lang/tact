struct InnerMost { a: Int }
struct L2 { i: InnerMost }
struct L3 { l2: L2 }
struct L4 { l3: L3 }
struct L5 { l4: L4 }
struct L6 { l5: L5 }
struct L7 { l6: L6 }

contract Deep7 {
    nest: L7;
    init() {
        self.nest = L7{ l6: L6{ l5: L5{ l4: L4{ l3: L3{ l2: L2{ i: InnerMost{ a: 42 } } } } } } };
    }
}