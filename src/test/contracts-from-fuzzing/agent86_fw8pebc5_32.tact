// wide contract fields + struct
struct Data {
    a: Int; b: Bool; c: String; d: Address; e: Int?; f: Bool?; g: String?; h: Address?;
}

contract WideFields {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Bool; f7: Bool; f8: Bool;
    f9: Address; f10: Address; 
    f11: String; f12: String; 
    f13: Int?; f14: Bool?; f15: Address?; f16: String?;
    data: Data;

    init() {
        self.f1=1; self.f2=2; self.f3=3; self.f4=4; self.f5=5;
        self.f6=false; self.f7=true; self.f8=false;
        self.f9=myAddress(); self.f10=myAddress();
        self.f11=""; self.f12="";
        self.f13=null; self.f14=null; self.f15=null; self.f16=null;
        self.data = Data{a:1,b:true,c:"",d:myAddress(),e:null,f:null,g:null,h:null};
    }
}