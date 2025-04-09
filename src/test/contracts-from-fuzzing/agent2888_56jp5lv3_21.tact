// optional nested multiple times
struct DeepOpt {
    inner: Int?;
}

contract NestedOptOpt {
    main: DeepOpt?;

    init() {
        self.main = null;
    }
}