// large nested struct chain with diverse types
struct L1 { a: Int; }
struct L2 { b: Bool; l1: L1; }
struct L3 { s: String; l2: L2; }
struct L4 { c: Cell; l3: L3; }
struct L5 { sl: Slice; l4: L4; }
struct L6 { addr: Address; l5: L5; }

contract LargeChain {
    data: L6;
    init() {
        self.data = L6{
            addr: myAddress(),
            l5: L5{
                sl: emptyCell().asSlice(),
                l4: L4{
                    c: emptyCell(),
                    l3: L3{
                        s: "ok",
                        l2: L2{
                            b: true,
                            l1: L1{ a: 10 }
                        }
                    }
                }
            }
        };
    }
}