struct LongNested {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

struct OuterLong {
    x: LongNested;
    y: LongNested;
    z: Bool;
}

contract ManyRepeatNested {
    persist: OuterLong;

    init() {
        self.persist = OuterLong{
            x: LongNested{a:1,b:true,c:"c",d:null,e:null,f:null},
            y: LongNested{a:2,b:false,c:"d",d:null,e:null,f:null},
            z: true
        };
    }
}