struct DeeplyNested {
    level: Int;
    next: Nested2;
}

struct Nested2 {
    lvl: Int;
    next: Nested3;
}

struct Nested3 {
    l: Int;
    next: Nested4;
}

struct Nested4 {
    q: Int;
    next: Nested5;
}

struct Nested5 {
    z: Int;
}

contract TestContract {
    d: DeeplyNested;
    init() {
        self.d = DeeplyNested{
            level:1,
            next: Nested2{
                lvl:2,
                next: Nested3{
                    l:3,
                    next: Nested4{
                        q:4,
                        next: Nested5{z:5}
                    }
                }
            }
        };
    }
}