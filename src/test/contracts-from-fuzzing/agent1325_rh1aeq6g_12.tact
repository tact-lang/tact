struct L1 { foo: Int; }
struct L2 { bar: L1; }
struct L3 { baz: L2; }

contract IndirectDeep {
    store: L3;

    init() {
        self.store = L3{
            baz: L2{
                bar: L1{
                    foo: 999
                }
            }
        };
    }
}