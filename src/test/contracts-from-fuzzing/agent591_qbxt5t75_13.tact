struct Mix {
    intVal: Int;
    optStr: String?;
    boolVal: Bool;
    sliceVal: Slice;
    addrVal: Address;
}

contract MixTest {
    state: Mix;
    init() {
        self.state = Mix{
            intVal: 22,
            optStr: "hello",
            boolVal: true,
            sliceVal: emptyCell().asSlice(),
            addrVal: myAddress()
        };
    }
}