struct OptIntStruct {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract OptInts {
    val: OptIntStruct;

    init() {
        self.val = OptIntStruct{
            x: null,
            y: 42,
            z: null,
        };
    }
}
