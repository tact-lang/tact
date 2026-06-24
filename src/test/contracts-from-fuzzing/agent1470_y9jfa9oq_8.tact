struct DeepOpt {
    inner_str: String?;
    inner_flag: Bool?;
}

struct ContainerOpt {
    deep: DeepOpt?;
    outer_flag: Bool;
}

contract OptNested {
    val: ContainerOpt;

    init() {
        self.val = ContainerOpt{
            deep: DeepOpt{
                inner_str: null,
                inner_flag: true,
            },
            outer_flag: false,
        };
    }
}