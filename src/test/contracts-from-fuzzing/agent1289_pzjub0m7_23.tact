struct MegaFields {
    i1: Int;
    i2: Int as uint8;
    b1: Bool;
    s1: String;
    a1: Address;
    b2: Bool;
    s2: String;
    i3: Int as int32;
    a2: Address;
    i4: Int;
}

contract MegaStructTest {
    mega: MegaFields;

    init() {
        self.mega = MegaFields{
            i1:1, i2:2, b1:true, s1:"s",
            a1:myAddress(), b2:false, s2:"t",
            i3:-33, a2:myAddress(), i4:44
        };
    }
}