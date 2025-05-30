struct ManyFields {
    f1: Int; f2: Int; f3: Int; f4: Int;
    f5: Bool; f6: Bool; f7: Bool; f8: Bool;
    f9: String; f10: String; f11: String; f12: String;
}

contract MixedManyFields {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1:1,f2:2,f3:3,f4:4,f5:true,f6:false,f7:true,f8:false,
            f9:"a",f10:"b",f11:"c",f12:"d"
        };
    }
}
