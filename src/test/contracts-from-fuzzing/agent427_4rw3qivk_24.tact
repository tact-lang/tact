struct OptBoolDefault {
    foo: Bool?;
}

contract OptDefaultWrap {
    data: OptBoolDefault;

    init() {
        self.data = OptBoolDefault{
            foo: null
        };
    }
}