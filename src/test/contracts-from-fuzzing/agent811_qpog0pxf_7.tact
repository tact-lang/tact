struct Child {
    a: Int;
    b: String;
    c: Bool?;
}

struct MixedWide {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Address;
    x5: Cell;
    x6: Slice;
    x7: Int?;
    x8: String?;
    x9: Bool?;
    c1: Child;
    c2: Child?;
    y1: Int;
    y2: Int;
    y3: Bool;
    y4: String;
    y5: Address;
    y6: Slice;
    y7: Int?;
    y8: Bool?;
}

contract ComplexWide {
    state: MixedWide = MixedWide{
        x1: 1,
        x2: true,
        x3: "A",
        x4: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        x5: cell("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
        x6: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
        x7: null,
        x8: null,
        x9: null,
        c1: Child{a: 10, b: "abc", c: null},
        c2: null,
        y1: 2,
        y2: 3,
        y3: false,
        y4: "B",
        y5: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c"),
        y6: slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw="),
        y7: 123,
        y8: true,
    };

    init() {
        self.state = self.state; // no-op just to access persistent variable
    }
}