struct Inner1 { x: Int?; }
struct Inner2 { y: Inner1?; }
struct Inner3 { z: Inner2?; }

contract NullChain {
    val: Inner3;

    init() {
        self.val = Inner3{
            z: null
        };
    }
}