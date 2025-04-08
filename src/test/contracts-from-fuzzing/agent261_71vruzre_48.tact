struct WideStruct {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Bool; f7: Bool; f8: Bool; f9: Bool;
    s1: String; s2: String;
}

contract WideStorage {
    store: WideStruct;

    init() {
        self.store = WideStruct {
            f1:1,f2:2,f3:3,f4:4,f5:5,
            f6:true,f7:false,f8:true,f9:false,
            s1:"one", s2:"two"
        };
    }

    receive() {
        let _ = self.store.f5;
    }
}