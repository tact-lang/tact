struct FourFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
}

contract ManyStructs {
    s1: FourFields;
    s2: FourFields;

    init() {
        self.s1 = FourFields{ f1:1, f2:true, f3:"a", f4: myAddress() };
        self.s2 = FourFields{ f1:2, f2:false, f3:"b", f4: myAddress() };
    }
}