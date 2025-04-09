struct Wrap {
    field: Int; 
}

contract BigList {
    f1: Wrap; f2: Wrap; f3: Wrap; f4: Wrap; f5: Wrap; f6: Wrap; f7: Wrap; f8: Wrap; f9: Wrap; f10: Wrap;
    init() {
        self.f1 = Wrap{ field: 1 };
        self.f2 = Wrap{ field: 2 };
        self.f3 = Wrap{ field: 3 };
        self.f4 = Wrap{ field: 4 };
        self.f5 = Wrap{ field: 5 };
        self.f6 = Wrap{ field: 6 };
        self.f7 = Wrap{ field: 7 };
        self.f8 = Wrap{ field: 8 };
        self.f9 = Wrap{ field:9 };
        self.f10= Wrap{ field:10 };
    }
}