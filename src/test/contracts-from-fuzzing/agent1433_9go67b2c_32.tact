struct FlatManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: String;
    l: String;
    m: String;
    n: String;
    o: String;
}

contract ContractHugeStruct {
    data: FlatManyFields;

    init() {
        self.data = FlatManyFields{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:"k",l:"l",m:"m",n:"n",o:"o"
        };
    }
}
