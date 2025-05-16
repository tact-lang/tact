struct Compose1 {
    x: Int;
}

struct Compose2 {
    y: Int;
    sub: Compose1;
}

struct Compose3 {
    z: Int;
    sub2: Compose2;
}

contract ChainCompose {
    c: Compose3;
    init() {
        self.c = Compose3{
            z: 1,
            sub2: Compose2{
                y: 2,
                sub: Compose1{ x: 3 }
            }
        };
    }
}