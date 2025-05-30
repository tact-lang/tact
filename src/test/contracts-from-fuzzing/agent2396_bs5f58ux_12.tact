struct DeepOptional {
    inner: Int?;
    text: String?;
    flag: Bool?;
}

struct OptionalContainer {
    maybe: DeepOptional?;
    present: String;
}

contract DoubleOpt {
    val: OptionalContainer;

    init() {
        self.val = OptionalContainer{
            maybe: null,
            present: "exists"
        };
    }
}