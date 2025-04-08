struct ManyFields {
    a: Int;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as int64;
    e: Bool;
    f: String;
    g: Bool;
    h: Int as uint32;
    i: Int as int128;
    j: String;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a:1,b:2,c:3,d:4,e:true,f:"hi",g:false,h:5,i:6,j:"bye"
        };
    }
}
