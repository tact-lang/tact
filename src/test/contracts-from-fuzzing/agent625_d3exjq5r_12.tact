struct OptNested {
    s: SubOpt?;
}

struct SubOpt {
    x: Int?;
    y: Bool?;
}

contract Test {
    data: OptNested;

    init() {
        self.data = OptNested {
            s: SubOpt { x: null, y: false }
        };
    }
}