struct BaseStruct {
    a: Int;
    b: Bool;
}

struct WrapOptional {
    inner: BaseStruct?;
}

contract OptionalStructWrap {
    w: WrapOptional;

    init() {
        self.w = WrapOptional{
            inner: BaseStruct{a:99,b:true}
        };
    }
}