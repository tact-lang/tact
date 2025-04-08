struct OptionalInNested {
    s: InnerOpt;
}

struct InnerOpt {
    x: Int?;
    y: String?;
}

contract NestedOptionals {
    data: OptionalInNested;

    init() {
        self.data = OptionalInNested{
            s: InnerOpt{x: null, y: null}
        };
    }

    receive() {
        let _ = self.data.s.x;
    }
}