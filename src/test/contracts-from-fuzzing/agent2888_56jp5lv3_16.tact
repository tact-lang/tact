// test multiple structs with cross references
struct First {
    val: Int;
}

struct Second {
    f_ref: First;
}

contract Cross {
    s: Second;

    init() {
        self.s = Second{
            f_ref: First{
                val: 888,
            },
        };
    }
}