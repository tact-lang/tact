struct ManyOptionals {
    f1: Int?;
    f2: Int?;
    f3: Int?;
    f4: Int?;
    f5: Int?;
}

contract OptFlood {
    f: ManyOptionals;

    init() {
        self.f = ManyOptionals{ f1: null,f2:null,f3:3,f4:null,f5:5 };
    }
}