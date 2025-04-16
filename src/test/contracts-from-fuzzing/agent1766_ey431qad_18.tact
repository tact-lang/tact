struct Deep {
    value: Int as uint8;
}

struct Outer {
    nested: Deep;
}

contract SerializedNested {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Deep{
                value: 200
            }
        };
    }
}
