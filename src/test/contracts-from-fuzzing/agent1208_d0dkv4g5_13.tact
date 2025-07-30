struct InnerS {
    x: Int?;
    y: Bool;
}

struct OuterS {
    maybeInner: InnerS?;
    label: String;
}

contract NestedOptionalStruct {
    data: OuterS;

    init() {
        self.data = OuterS{
            maybeInner: InnerS{ x: null, y: true },
            label: "nested opt"
        };
    }
}