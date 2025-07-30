struct Deep1 { f1: Int = 1; }
struct Deep2 { f2: Deep1 = Deep1{}; }
struct Deep3 { f3: Deep2 = Deep2{}; }
struct Deep4 { f4: Deep3 = Deep3{}; }
struct Deep5 { f5: Deep4 = Deep4{}; }

contract DeepFive {
    data: Deep5 = Deep5{};

    init() {
        self.data = Deep5{
            f5: Deep4{
                f4: Deep3{
                    f3: Deep2{
                        f2: Deep1{ f1: 100 }
                    }
                }
            }
        };
    }
}