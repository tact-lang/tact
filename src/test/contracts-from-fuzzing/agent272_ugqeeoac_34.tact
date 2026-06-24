// deeply nested mix
struct Lev3 {
    i:Int?;
    s:String?;
}

struct Lev2 {
    l3:Lev3;
}

struct Lev1 {
    l2:Lev2;
}

contract DeepMixPersist {
    d:Lev1;
    init() {
        self.d=Lev1{ l2: Lev2{ l3: Lev3{ i:null, s:"s" } } };
    }
}