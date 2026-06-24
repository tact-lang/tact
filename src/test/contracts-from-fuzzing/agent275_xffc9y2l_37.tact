struct SText {
    t: String;
}

struct ContainerOpt {
    s: SText?;
}

contract OptionalStructString {
    f: ContainerOpt;

    init() {
        self.f = ContainerOpt{ s: null };
    }
}