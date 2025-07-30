struct DefaultVsSet {
    a: Int = 1;
    b: Bool = false;
    c: String = "def";
}

contract TestContract {
    data: DefaultVsSet;

    init() {
        self.data = DefaultVsSet{
            a: 42,
            b: true,
            c: "changed"
        };
    }
}
