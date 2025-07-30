struct Multi {
    x: Int;
    y: Bool?;
    z: String;
}

contract OptMidStruct {
    payload: Multi;

    init() {
        self.payload = Multi{
            x: 5,
            y: null,
            z: "hi",
        };
    }
}