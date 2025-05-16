struct PartOptionals {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
}

contract TestContract {
    state: PartOptionals;

    init() {
        self.state = PartOptionals{
            f1: 1,
            f2: null,
            f3: true,
            f4: false,
        };
    }
}