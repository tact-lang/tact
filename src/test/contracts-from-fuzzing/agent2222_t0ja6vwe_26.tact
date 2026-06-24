struct S {
  a: Int;
  b: Bool;
}

contract TestContract {
    f0: Int;
    f1: Int?;
    f2: Bool;
    f3: Bool?;
    f4: String;
    f5: String?;
    f6: S;
    f7: S;

    init() {
        self.f0=0; self.f1=null; self.f2=true; self.f3=null; self.f4="S"; self.f5=null;
        self.f6 = S{ a:1, b:true };
        self.f7 = S{ a:2, b:false };
    }
}