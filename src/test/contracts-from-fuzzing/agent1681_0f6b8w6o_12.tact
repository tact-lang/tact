struct L1 { a: Int; b: Int }
struct L2 { c: L1; d: Int }
struct L3 { e: L2; f: Int }
struct L4 { g: L3; h: Int }
struct L5 { i: L4; j: Int }

contract DeepChain {
    data: L5;

    init() {
        self.data = L5{
            i: L4{
                g: L3{
                    e: L2{
                        c: L1{ a:1, b:2 }, d:3 },
                    f:4 },
                h:5 },
            j:6
        };
    }

    receive() {
        self.data = self.data;
    }
}