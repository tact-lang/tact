// Contract with a very deep nesting chain with various types
struct L5 { x5: Int as uint8; }
struct L4 { x4: L5; b: Bool; }
struct L3 { x3: L4; s: String; }
struct L2 { x2: L3; o: Bool?; }
struct L1 { x1: L2; a: Address; }

contract NestedChain {
    deep: L1;

    init() {
        self.deep = L1{
            x1: L2{
                x2: L3{
                    x3: L4{
                        x4: L5{ x5:5 },
                        b: true
                    },
                    s: "hello"
                },
                o: null
            },
            a: myAddress()
        };
    }
}
