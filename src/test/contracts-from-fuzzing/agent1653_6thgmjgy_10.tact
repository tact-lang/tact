struct TestStruct {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
}

contract TestContract {
    ts: TestStruct;

    init() {
        self.ts = TestStruct{
            a:1,b:null,c:"c",d:2,e:true,f:"f",g:7,h:false,i:"i",j:null
        };
    }
}