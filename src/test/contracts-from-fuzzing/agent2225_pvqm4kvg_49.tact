struct Ints {
    a:Int; b:Int; c:Int;
}

struct WrapOpt {
    inner: Ints?;
}

contract OptionalStruct {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{ inner: null };
    }
}