struct ExtNested {
    inner: Mid;
}

struct Mid {
    x: Int;
    y: Leaf;
}

struct Leaf {
    z: Bool;
    s: String;
}

contract ReferencedStructs {
    data: ExtNested;

    init() {
        self.data = ExtNested{
            inner: Mid{
                x: 1,
                y: Leaf{
                    z: true,
                    s: "leaf"
                }
            }
        };
    }
}
