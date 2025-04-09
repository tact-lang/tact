struct MessageS {
    x: Int;
}

contract MixedOptionals {
    normal: Int;
    optNumber: Int?;
    optBool: Bool?;
    optStruct: MessageS?;

    init() {
        self.normal = 8;
        self.optNumber = null;
        self.optBool = true;
        self.optStruct = null;
    }
}