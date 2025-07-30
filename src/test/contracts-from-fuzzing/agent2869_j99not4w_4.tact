struct Unit {
    flag: Bool;
}

struct Wrapper {
    nested: Unit?;
}

contract OptionalsTest {
    entry: Wrapper;

    init() {
        self.entry = Wrapper{
            nested: null,
        };
    }
}
