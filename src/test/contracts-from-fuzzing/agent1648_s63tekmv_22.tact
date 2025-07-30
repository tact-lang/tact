// deeply nested optional inside optional chain (depth 4)

struct One {
    two: Two?;
}

struct Two {
    three: Three?;
}

struct Three {
    four: Four?;
}

struct Four {
    val: Int;
}

contract TestContract {
    nest: One;
    init() {
        self.nest = One {
            two: Two {
                three: Three {
                    four: null
                }
            }
        };
    }
}