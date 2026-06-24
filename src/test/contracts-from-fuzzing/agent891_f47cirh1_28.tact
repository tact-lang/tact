struct Wrapper {
    i: Int;
}

contract NestedOptStructOpt {
    field: Wrapper?;

    init() {
        self.field = null;
    }
}
