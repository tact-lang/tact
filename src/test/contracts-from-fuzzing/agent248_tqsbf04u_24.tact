struct InnerMost {
    v: Bool?; 
    s: String?; 
}

struct Mid {
    inner: InnerMost; 
    num: Int;
    flag: Bool?;
}

struct Top {
    mid: Mid;
    label: String;
}

contract OptCascade {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                inner: InnerMost{ v: null, s: "hi" }, 
                num: 5, 
                flag: true
            }, 
            label: "tree"
        };
    }
}