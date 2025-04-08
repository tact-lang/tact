struct Optional1 { o1: Int?; }
struct Optional2 { o2: Optional1?; }
struct Optional3 { o3: Optional2?; }
contract DeepOptionChain {
    chain: Optional3;
    init() {
        self.chain = Optional3{ o3: Optional2{ o2: Optional1{ o1:null } } };
    }
}