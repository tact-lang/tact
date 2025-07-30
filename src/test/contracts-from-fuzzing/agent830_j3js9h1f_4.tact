struct LongStruct {
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
}

contract TestContract {
    payload: LongStruct;

    init() {
        self.payload = LongStruct{
            a:1,b:true,c:"1",d:2,e:false,f:"2",g:3,h:true,i:"3",j:4
        };
    }
}