struct MixedPrim {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    stringVal: String;
}

contract MixedPrimTest {
    val: MixedPrim;

    init() {
        self.val = MixedPrim{
            intVal:1, boolVal:false, addrVal:myAddress(), stringVal:"hi"
        };
    }
}
