struct Large1 { f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; }
struct Large2 { f6: Int; f7: Int; f8: Int; f9: Int; f10: Int; }

struct LargeCombined {
  l1: Large1;
  l2: Large2;
  f11: Int;
  f12: Int;
}

contract TestContract {
    big: LargeCombined;

    init() {
        self.big = LargeCombined{
            l1: Large1{ f1:1, f2:2, f3:3, f4:4, f5:5 },
            l2: Large2{ f6:6, f7:7, f8:8, f9:9, f10:10 },
            f11: 11,
            f12: 12,
        };
    }
}