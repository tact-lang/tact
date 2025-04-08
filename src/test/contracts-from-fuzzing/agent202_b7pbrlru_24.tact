struct HasOptional {
    maybeNum: Int?;
}

struct WrapOpt {
    inner1: HasOptional;
    inner2: HasOptional?
}

contract NestedOptStruct {
    data: WrapOpt;
    init() {
        self.data = WrapOpt{
            inner1: HasOptional{ maybeNum: null },
            inner2: null
        };
    }

    receive() {
        let _ = self.data.inner1.maybeNum;
    }
}