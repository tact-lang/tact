struct Sub1 { x: Int }
struct Sub2 { y: Bool }
struct Sub3 { z: String }

struct Super {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;
}

contract NestedSuper {
    val: Super;
    init() {
        self.val = Super{
            s1: Sub1{x: 9},
            s2: Sub2{y: true},
            s3: Sub3{z: "ok"}
        };
    }
}