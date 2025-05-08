struct Wide {
    i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
    s1: String; s2: String; s3: String;
    b1: Bool; b2: Bool;
    a1: Address; a2: Address;
}

contract WideFields {
    val: Wide;

    init() {
        self.val = Wide{
            i1:1,i2:2,i3:3,i4:4,i5:5,
            s1:"a",s2:"b",s3:"c",
            b1:true,b2:false,
            a1:myAddress(),a2:myAddress(),
        };
    }
}