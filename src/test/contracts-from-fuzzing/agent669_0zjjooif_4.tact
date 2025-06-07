struct LongList {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: Int;
    f: String;
    g: Bool?;
    h: Int?;
    i: String;
    j: Bool;
}

contract ManyFields {
    list: LongList;

    init() {
        self.list = LongList{
            a:1,b:2,c:true,d:"d",e:5,f:"f",g:null,h:null,i:"i",j:false
        };
    }
}