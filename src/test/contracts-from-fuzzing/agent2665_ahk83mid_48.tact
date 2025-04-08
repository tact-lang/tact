struct DefaultAndReq {
    a: Int = 10;
    b: String;
}

contract MixedFieldStruct {
    state: DefaultAndReq;

    init() {
        self.state = DefaultAndReq{
            b: "hi"
        };
    }
}