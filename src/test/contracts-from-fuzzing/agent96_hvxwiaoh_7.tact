struct SubInner {
    value: Int = 7;
    flag: Bool?;
}

struct SubOuter {
    label: String = "default";
    sInner: SubInner;
}

contract NestedDefaults {
    state: SubOuter;

    init() {
        self.state = SubOuter{
            sInner: SubInner{
                value: 42,
                flag: true,
            },
            label: "override",
        };
    }

    receive() {}
}