struct Payload {
    x: Int;
    y: Int;
}

contract FieldOverride {
    payload: Payload = Payload{
        x: 1,
        y: 2,
    };

    init() {
        self.payload = Payload{
            x: 10,
            y: 20,
        };
    }
}
