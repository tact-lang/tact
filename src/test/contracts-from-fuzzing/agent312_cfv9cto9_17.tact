struct L3 { num: Int; }
struct L2 { flag: Bool; l3: L3; }
struct L1 { text: String; l2: L2; }

contract TestContract {
    data: L1;
    init() {
        self.data = L1{
            text: "l1",
            l2: L2{
                flag: true,
                l3: L3{ num: 100 }
            }
        };
    }
}