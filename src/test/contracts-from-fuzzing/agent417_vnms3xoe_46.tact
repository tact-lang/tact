struct Def {
  a: Int = 3;
}

contract DefaultsInside {
    fld: Def;

    init() {
        self.fld = Def{};
    }
}