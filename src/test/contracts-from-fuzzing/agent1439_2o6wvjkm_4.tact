struct DefaultOptional {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OptionalFieldsContract {
    opt: DefaultOptional;

    init() {
        self.opt = DefaultOptional{ x:null, y:null, z:1 };
    }
}