struct Details {
    x: Int;
    y: String;
}

contract OptionalStruct {
    meta: Details?;

    init() {
        self.meta = null;
    }

    receive() {
        self.meta = Details{
            x: 101,
            y: "assigned"
        };
    }
}