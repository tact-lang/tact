struct OptNest1 {
    f: OptNest2?;
}

struct OptNest2 {
    f: OptNest3?;
}

struct OptNest3 {
    f: Int?;
}

contract OptDeep {
    s: OptNest1?;

    init() {
        self.s = OptNest1{
            f: OptNest2{
                f: OptNest3{
                    f: 1
                }
            }
        };
    }
}
