struct One { x: Int }
struct Two { y: Bool }
struct Three { z: String }

contract ThreeStructs {
    s1: One;
    s2: Two;
    s3: Three;

    init() {
        self.s1 = One{x:1};
        self.s2 = Two{y:true};
        self.s3 = Three{z:"z"};
    }
}