struct Leaf {
    x: Int?;
}
struct Mid {
    leaf: Leaf?;
    flag: Bool;
}
struct Root {
    mid: Mid?;
    text: String;
}

contract TestContract {
    s: Root;
    init() {
        self.s = Root{
            mid: Mid{
                leaf: Leaf{ x: null },
                flag: true
            },
            text: "yo"
        };
    }
}