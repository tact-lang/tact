// contract with long nested struct chain w/ optionals deep in chain
struct L3 { v: Int?; }
struct L2 { l3: L3; }
struct L1 { l2: L2; }

contract OptDeepChain {
    data: L1;
    init() {
        self.data = L1{
            l2: L2{
                l3: L3{ v: null }
            }
        };
    }
}