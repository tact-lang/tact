struct Mixed {
    intVal: Int;
    optBool: Bool?;
    strVal: String;
    addr: Address;
}

contract MixedNested {
    m: Mixed;

    init() {
        self.m = Mixed{
            intVal: 5,
            optBool: true,
            strVal: "nested",
            addr: myAddress()
        };
    }
}