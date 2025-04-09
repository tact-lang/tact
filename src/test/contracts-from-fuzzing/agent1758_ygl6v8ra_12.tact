contract MixedTypes {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Address?;

    init() {
        self.f1=1; self.f2=true; self.f3="x"; self.f4=myAddress();
        self.f5=null; self.f6=false; self.f7=null; self.f8=null;
    }
}