struct Sub {
    z: Int;
}

struct Mid {
    y: Sub;
}

struct Top {
    x: Mid;
}

contract DeeplyNested {
    nested: Top;

    init() {
        self.nested = Top{
            x: Mid{
                y: Sub{
                    z: 777,
                },
            },
        };
    }

    receive() {
        let v = self.nested;
    }
}