struct Innermost {
    Field: Int;
}

struct Middle {
    Inner: Innermost;
    Extra: Int;
}

struct Outer {
    Mid: Middle;
    More: Int;
}

contract TestNested {
    receive() {
        // Create nested struct instance
        let instance: Outer = Outer {
            Mid: Middle {
                Inner: Innermost { Field: 42 },
                Extra: 100
            },
            More: 7
        };
    }
}
