// Large nested structs with cross-nesting
struct One {
    x: Int;
    y: Bool;
    s: String;
}

struct Two {
    o: One;
    flag: Bool;
}

struct Three {
    t: Two;
    str: String;
}

contract CrossNest {
    val: Three;
    init() {
        self.val = Three{
            t: Two{
                o: One{ x: 5, y: true, s: "abc" },
                flag: false,
            },
            str: "done",
        };
    }
}