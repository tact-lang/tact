struct B1 { x: Int?; }
struct B2 { y: B1?; }
struct B3 { z: B2?; }

contract OptionalChain {
    chain: B3;

    init() {
        self.chain = B3{ z: null };
    }
}