struct MixNestedOptionalDefault {
    a: Int;
    b: NestedOpt?
}

struct NestedOpt {
    x: Int;
    y: Bool? = null;
    z: String;
}

contract TestContract {
    data: MixNestedOptionalDefault;

    init() {
        self.data = MixNestedOptionalDefault{
            a: 7,
            b: NestedOpt{
                x: 1,
                z: "hello"
            }
        };
    }
}
