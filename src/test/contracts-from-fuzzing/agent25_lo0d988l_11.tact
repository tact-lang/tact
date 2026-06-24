struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
    m: Int;
    n: Bool;
    o: String;
}

contract TestContract {
    field: BigStruct;

    init() {
        self.field = BigStruct{
            a:1,b:true,c:"c",d:2,e:false,f:"f",g:3,h:true,i:"i",j:4,k:true,l:"l",m:5,n:false,o:"o"
        };
    }
}