struct SWithOptionals {
    x: Int?;
    y: Bool?;
}

struct Wrap {
    s1: SWithOptionals?;
    s2: SWithOptionals?;
}

contract OptStructWrapped {
    val: Wrap;

    init() {
        self.val = Wrap{
            s1: null,
            s2: null
        };
    }

    receive() {
        self.val = Wrap{
            s1: SWithOptionals{x: 7, y: true},
            s2: SWithOptionals{x: null, y: false}
        };
    }
}