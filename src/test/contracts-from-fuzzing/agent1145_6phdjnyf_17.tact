// Very deep optional nesting with fields on every level
struct L1 { f: L2?; }
struct L2 { f: L3?; }
struct L3 { f: L4?; }
struct L4 { f: L5?; }
struct L5 { val: Int?; }

contract OptionalDeepNesting {
    data: L1;
    init() {
        self.data = L1{
            f: L2{
                f: L3{
                    f: L4{
                        f: L5{ val: null }
                    }
                }
            }
        };
    }
}
