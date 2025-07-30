struct SOptWrapped {
    inner: Wrapped?;
}

struct Wrapped {
    num: Int;
}

contract TestContract {
    x: SOptWrapped;

    init() {
        self.x = SOptWrapped{ inner: null };
    }
}