struct DefaultsOpt {
    s: String = "default";
    n: Int?;
    f: Bool?;
}

contract OptDefaultsPreserve {
    val: DefaultsOpt;

    init() {
        self.val = DefaultsOpt{
            s: "assigned",
            n: null,
            f: null,
        };
    }
}
