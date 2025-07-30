struct SubData {
    n: Int;
}

struct MidData {
    s1: SubData;
    s2: SubData;
    comment: String;
}

struct RootData {
    m1: MidData;
    m2: MidData;
    flag: Bool;
}

contract DeeplyNested {
    root: RootData;

    init() {
        self.root = RootData{
            m1: MidData{
                s1: SubData{n:1}, s2: SubData{n:2}, comment: "C1"
            },
            m2: MidData{
                s1: SubData{n:3}, s2: SubData{n:4}, comment: "C2"
            },
            flag: true
        };
    }
}