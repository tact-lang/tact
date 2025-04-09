struct SDeepOpt {
    a: InnerOpt?;
}

struct InnerOpt {
    x: String;
    y: Bool;
}

contract DeepOptContract {
    data: SDeepOpt;

    init() {
        self.data = SDeepOpt{
            a: InnerOpt{
                x: "Deep",
                y: false
            }
        };
    }
}
