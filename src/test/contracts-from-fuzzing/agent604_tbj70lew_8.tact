struct InnerOptional {
    val: Int?;
}

struct OuterOptional {
    inner1: InnerOptional?;
    inner2: InnerOptional?;
}

contract DeepOptionals {
    outer: OuterOptional;

    init() {
        self.outer = OuterOptional{
            inner1: null,
            inner2: null,
        };
    }

    receive() {
        let _ = self.outer;
    }
}