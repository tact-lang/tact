struct BigOptional {
    f1: Int?;
    f2: Bool?;
    f3: Int?;
    f4: Bool?;
    f5: Int?;
    f6: Bool?;
    f7: Int?;
    f8: Bool?;
}

contract ManyOptionals {
    big: BigOptional;
    init() {
        self.big = BigOptional{
            f1:null,f2:null,f3:null,f4:null,
            f5:null,f6:null,f7:null,f8:null
        };
    }
    receive() {
        let _ = self.big.f1;
    }
}