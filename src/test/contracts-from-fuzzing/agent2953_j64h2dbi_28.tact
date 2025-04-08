struct OptionalDeepest {
    q: Int?;
}

struct OptionalLevel2 {
    od: OptionalDeepest?;
}

contract OptOptDeepWrap {
    inner: OptionalLevel2;

    init() {
        self.inner = OptionalLevel2{
            od: OptionalDeepest{
                q: null
            }
        };
    }
}