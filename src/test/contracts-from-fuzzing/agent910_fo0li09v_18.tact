struct Sibling1 { x: Int; }
struct Sibling2 { y: Int; }
struct Sibling3 { z: Int; }

struct NestSiblings {
    s1: Sibling1;
    s2: Sibling2;
    s3: Sibling3;
}

contract SiblingNest {
    data: NestSiblings;

    init() {
        self.data = NestSiblings{
            s1: Sibling1{x:10},
            s2: Sibling2{y:20},
            s3: Sibling3{z:30}
        };
    }
}