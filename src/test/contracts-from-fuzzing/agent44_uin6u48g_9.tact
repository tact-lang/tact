struct OptionalInMsg {
    val: Int?;
}

message(1) HasOptional {
    container: OptionalInMsg;
}

contract MsgWithOptional {
    hasopt: HasOptional;

    init() {
        self.hasopt = HasOptional {
            container: OptionalInMsg {
                val: null
            }
        };
    }
}
