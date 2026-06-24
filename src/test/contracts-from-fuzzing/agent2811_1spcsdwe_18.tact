struct Combine {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
}

contract ComboFields {
    data: Combine;

    init() {
        self.data = Combine{
            a:1,b:true,c:"X",d:null,e:false,f:"Y"
        };
    }
}