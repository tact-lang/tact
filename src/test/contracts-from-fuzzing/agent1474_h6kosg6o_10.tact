struct OptionalNest {
    inn: Int?;
}

struct OptionalOuter {
    mid: OptionalNest?;
}

contract OptionalContract {
    data: OptionalOuter?;

    init() {
        self.data = null;
    }
}
