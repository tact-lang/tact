struct OptionalMid {
    inner: Int?;
}

struct OptionalTop {
    mid: OptionalMid?;
}

contract NestedOptField {
    state: OptionalTop;

    init() {
        self.state = OptionalTop{
            mid: OptionalMid{
                inner: 100
            }
        };
    }
}