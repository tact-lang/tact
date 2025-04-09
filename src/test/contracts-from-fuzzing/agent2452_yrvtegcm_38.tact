struct OptionalDeepInside {
    x: Int;
    innerOpt: Int?;
    y: Int;
}

contract OptionalInsideStruct {
    data: OptionalDeepInside = OptionalDeepInside{x:1,innerOpt:null,y:2};
    init() {
        self.data = OptionalDeepInside{x:1,innerOpt:null,y:2};
    }
}