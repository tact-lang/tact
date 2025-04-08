// Large struct: 15 fields mixed types
struct Combo {
    i1: Int;
    b1: Bool;
    s1: String;
    o1: Int?;
    o2: Bool?;
    i2: Int;
    b2: Bool;
    s2: String;
    o3: Int?;
    o4: String?;
    s3: String;
    b3: Bool;
    i3: Int;
    o5: Bool?;
    o6: Int?;
}

contract TestContract {
    data: Combo;

    init() {
        self.data = Combo{
            i1:1, b1:true, s1:"A", o1:null, o2:false,
            i2:2, b2:true, s2:"B", o3:null, o4:"x",
            s3:"C", b3:false, i3:3, o5:true, o6:null
        };
    }
}