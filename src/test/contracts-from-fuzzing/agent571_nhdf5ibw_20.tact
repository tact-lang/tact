struct S1 { x: Int; }
struct S2 { y: Bool; }

struct Mix {
    p: Int?;
    s1: S1?;
    s2: S2?;
    flag: Bool?;
}

contract TestContract {
    storage: Mix;

    init() {
        self.storage = Mix{
            p: null,
            s1: null,
            s2: null,
            flag: null
        };
    }
}