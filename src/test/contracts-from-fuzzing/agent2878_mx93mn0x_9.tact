struct OptNested {
    x: Int?;
    y: InnerOpt?;
}

struct InnerOpt {
    z: String?;
    flag: Bool;
}

contract TestContract {
    data: OptNested;

    init() {
        self.data = OptNested{
            x: null,
            y: InnerOpt{ z: null, flag: true }
        };
    }
}