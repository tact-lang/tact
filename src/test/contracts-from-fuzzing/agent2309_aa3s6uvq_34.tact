// deeply nested optional with init assigning value
struct End {
    val: Int;
}

struct Mid {
    end: End?;
}

struct Start {
    mid: Mid?;
}

contract OptInit {
    s: Start?;
    init() {
        self.s = Start{
            mid: Mid{
                end: null
            }
        };
    }
}