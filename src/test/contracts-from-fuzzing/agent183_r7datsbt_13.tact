// Nested structs with mix of optional nested structs and primitives
struct Leaf {
    val: Int;
    flag: Bool?;
}

struct Mid {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    main: Mid?;
    count: Int;
}

contract MixedNulls {
    state: Root = Root{
        main: null,
        count: 0,
    };

    init() {
        self.state = Root{
            main: Mid{
                left: Leaf{ val: 1, flag: null },
                right: Leaf{ val: 2, flag: true },
            },
            count: 2,
        };
    }
}