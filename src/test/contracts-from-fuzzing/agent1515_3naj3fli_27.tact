struct SOpt {
    x: Int?;
    y: Bool;
}

contract OptionalInsideStruct {
    val: SOpt;

    init() {
        self.val = SOpt{
            x: null,
            y: true,
        };
    }
}