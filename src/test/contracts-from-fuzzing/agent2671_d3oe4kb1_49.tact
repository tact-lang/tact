struct ManyOpts {
o1:Int?; o2:Int?; o3:Int?; o4:Int?; o5:Int?; o6:Int?; o7:Int?; o8:Int?;
o9:Int?; o10:Int?; o11:Int?; o12:Int?; o13:Int?; o14:Int?; o15:Int?; o16:Int?;
o17:Int?; o18:Int?; o19:Int?; o20:Int?; o21:Int?; o22:Int?; o23:Int?; o24:Int?;
o25:Int?; o26:Int?; o27:Int?; o28:Int?; o29:Int?; o30:Int?; o31:Int?; o32:Int?;
}

contract ManyOptionals {
    vals: ManyOpts;

    init() {
        self.vals = ManyOpts{};
    }
}