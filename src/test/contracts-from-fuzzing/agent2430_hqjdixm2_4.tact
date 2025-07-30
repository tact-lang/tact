struct OptionalDeepNest {
    inner: Int?;
    flag: Bool?;
}

struct OuterOpt {
    nested: OptionalDeepNest?;
    label: String;
}

contract OptTest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: OptionalDeepNest{ inner: 5, flag: false },
            label: "opt"
        };
    }
}
