struct ComplexWide {
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
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    bool5: Bool;
}

contract WideStructContract {
    data: ComplexWide;

    init() {
        self.data = ComplexWide{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            s1:"s1", s2:"s2", s3:"s3", s4:"s4", s5:"s5",
            bool1:true,bool2:false,bool3:true,bool4:false,bool5:true
        };
    }
}