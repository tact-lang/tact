struct SOptBool {
    a: Bool?;
}

contract OptionalBoolStruct {
    s: SOptBool? = null;

    init() {
        self.s = SOptBool{a:true};
    }
}