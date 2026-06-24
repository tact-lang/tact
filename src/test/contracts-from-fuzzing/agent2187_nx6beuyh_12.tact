struct Compose1 { x: Int; }
struct Compose2 { y: Int; }
struct Compose3 { z: Int; }

struct Composed {
    a: Compose1;
    b: Compose2;
    c: Compose3;
}

contract NestedCompose {
    val: Composed;

    init() {
        self.val = Composed{
            a: Compose1{x:1},
            b: Compose2{y:2},
            c: Compose3{z:3}
        };
    }
}