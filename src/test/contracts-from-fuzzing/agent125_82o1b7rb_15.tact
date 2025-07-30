struct ManyScalars {
    i1: Int;
    b1: Bool;
    a1: Address;
    s1: String;
    i2: Int;
    b2: Bool;
    a2: Address;
    s2: String;
    i3: Int;
    b3: Bool;
    a3: Address;
    s3: String;
}

contract TestContract {
    data: ManyScalars;
    init() {
        self.data = ManyScalars{
            i1:1, b1:true, a1:myAddress(), s1:"a",
            i2:2, b2:false, a2:myAddress(), s2:"b",
            i3:3, b3:true, a3:myAddress(), s3:"c"
        };
    }
}