struct SubFirst {
    a: Int;
}

struct SubSecond {
    b: Bool;
}

struct Comb {
    s1: SubFirst;
    s2: SubSecond;
    flag: Bool;
}

contract MultiStructs {
    combined: Comb;

    init() {
        self.combined = Comb{
            s1: SubFirst{ a: 1 },
            s2: SubSecond{ b: true },
            flag: false
        };
    }
}