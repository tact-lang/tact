struct InnerOpt {
    text: String;
}

struct MidOpt {
    nest: InnerOpt?;
    mark: Bool;
}

contract NestedDeepOptionals {
    x: MidOpt;
    y: Int?;

    init() {
        self.x = MidOpt{
            nest: null,
            mark: true
        };
        self.y = null;
    }
}