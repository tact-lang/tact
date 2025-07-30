struct HasMessage {
    m: Pigeon;
}

message Pigeon {}

contract MessageInsideStruct {
    f: HasMessage;

    init() {
        self.f = HasMessage{ m: Pigeon{} };
    }
}