struct SingleOpt {
    num: Int?;
}

struct ContainerOpt {
    sopt: SingleOpt?;
    s: String;
}

contract WrapperOpt {
    c: ContainerOpt;

    init() {
        self.c = ContainerOpt{
            sopt: null,
            s: "all good"
        };
    }
}
