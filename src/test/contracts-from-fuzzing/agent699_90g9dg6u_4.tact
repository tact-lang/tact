struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Bool;
    e: Int;
    f: String;
    g: Bool;
    h: Int;
    i: String;
    j: Bool;
    k: Int;
    l: Bool;
    m: String;
    n: Bool;
    o: String;
    p: Int;
}

contract ManyFields {
    state: BigFields;

    init() {
        self.state = BigFields{
            a:1,b:true,c:"a",d:false,e:2,f:"b",g:true,h:3,i:"c",j:false,k:4,l:true,m:"d",n:false,o:"e",p:5
        };
    }
}
