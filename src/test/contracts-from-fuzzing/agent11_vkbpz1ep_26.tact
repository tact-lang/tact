// large flat struct used as storage
struct BigFlat {
    a: Bool;
    b: Bool;
    c: Int;
    d: String;
    e: Address;
    f: Int;
    g: Bool;
    h: String;
    i: Int;
    j: Int;
    k: Bool;
    l: Bool;
    m: Int;
    n: String;
    o: Address;
}

contract TestContract {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            a:true,b:false,c:1,d:"a",e:myAddress(),f:2,g:false,h:"b",i:3,j:4,k:true,l:false,m:5,n:"c",o:myAddress()
        };
    }
}