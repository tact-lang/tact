struct OptionalDeep {
    inner: OptionalDeepInner?;
}

struct OptionalDeepInner {
    num: Int;
    next: OptionalLevel2?;
}

struct OptionalLevel2 {
    flag: Bool;
}

contract TestContract {
    state: OptionalDeep;

    init() {
        self.state = OptionalDeep{
            inner: OptionalDeepInner{
                num: 1,
                next: OptionalLevel2{
                    flag: true,
                }
            }
        };
    }
}
