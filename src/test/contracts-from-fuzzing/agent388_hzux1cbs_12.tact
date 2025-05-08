struct A { f: Int }
contract NestedOpt {
    s: A?;

    init() {
        self.s = A{f:1};
    }
}