struct OptionalMid {
    mid: Mid?;
}

struct Mid {
    x: Int;
    y: String;
}

contract T {
    f: OptionalMid;

    init() {
        self.f = OptionalMid{
            mid: Mid{
                x: 42,
                y: "yes"
            }
        };
    }
}