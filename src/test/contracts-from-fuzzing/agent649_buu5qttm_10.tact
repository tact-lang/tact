struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint32;
    h: Int as int64;
}

contract MixTest {
    m: Mix = Mix{
        a:1,b:true,c:"",d:null,e:null,f:null,g:100,h:-200
    };
    receive() {
        let _ = self.m.a;
    }
}