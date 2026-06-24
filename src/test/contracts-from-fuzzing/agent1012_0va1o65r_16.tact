struct OptionalsNested {
    f1: Int?;
    f2: Int?;
    f3: Int?;
}

contract ManyOptionals {
    o1: OptionalsNested?;
    o2: OptionalsNested?;

    init() {
        self.o1 = OptionalsNested{ f1:null,f2:null,f3:null };
        self.o2 = null;
    }
}