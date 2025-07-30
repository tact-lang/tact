struct LongList {
    a: Int;
    b: Int;
    c: Bool;
    d: Address;
    e: Bool;
    f: String;
    g: Address;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Address;
    n: Int;
    o: String;
    p: Bool;
    q: Int;
    r: Address;
    s: Bool;
    t: String;
}

contract LongFields {
    data: LongList;
    init() {
        self.data = LongList{
            a:1,b:2,c:true,d:myAddress(),e:false,f:"hi",
            g:myAddress(),h:true,i:"hello",j:3,
            k:false,l:"test",m:myAddress(),n:4,o:"world",
            p:true,q:5,r:myAddress(),s:false,t:"end"
        };
    }
}