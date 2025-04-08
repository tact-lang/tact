struct DefaultOpt {
    id: Int;
    label: String;
    optional: Bool?;
}

contract DefaultsOptional {
    val: DefaultOpt;

    init() {
        self.val = DefaultOpt{
            id: 1,
            label: "label",
            optional: null,
        };
    }
}