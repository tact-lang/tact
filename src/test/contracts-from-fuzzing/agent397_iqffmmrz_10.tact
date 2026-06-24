struct OptWrappedString {
    text: String?;
}

struct WrapperOpt {
    w: OptWrappedString?;
    flag: Bool;
}

contract TestContract {
    obj: WrapperOpt;

    init() {
        self.obj = WrapperOpt{
            w: null,
            flag: false
        };
    }
}