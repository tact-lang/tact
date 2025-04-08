struct Leaf {
    z: Int;
}

struct Mid {
    y: Leaf?;
}

struct Top {
    x: Mid?;
}

contract WeirdOptionals {
    data: Top;

    init() {
        self.data = Top{
            x: null,
        };
    }

    receive() {
        let _ = self.data;
    }
}