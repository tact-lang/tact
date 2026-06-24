struct MultiNest1 { a: Int; }
struct MultiNest2 { b: Bool; m1: MultiNest1; }
struct MultiNest3 { s: String; m2: MultiNest2; }

contract NestedCombo {
    mn3: MultiNest3;

    init() {
        self.mn3 = MultiNest3{
            s: "deep",
            m2: MultiNest2{
                b: true,
                m1: MultiNest1{ a: 123 }
            }
        };
    }
}