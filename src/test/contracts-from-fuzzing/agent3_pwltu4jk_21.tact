// Chain contract holding a struct within a struct within a struct, all optional
struct L3 { f: Int?; }
struct L2 { f: L3?; }
struct L1 { f: L2?; }

contract NestedOpts {
    field: L1;

    init() {
        self.field = L1{
            f: L2{
                f: L3{
                    f: null
                }
            }
        };
    }
}