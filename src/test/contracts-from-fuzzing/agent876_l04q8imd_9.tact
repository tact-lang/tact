struct Opt1 { f1: Int?; }
struct Opt2 { f2: Opt1?; }
struct Opt3 { f3: Opt2?; }

contract MultiOpt {
    state: Opt3;

    init() {
        self.state = Opt3{
            f3: Opt2{
                f2: Opt1{
                    f1: null
                }
            }
        };
    }

    receive() {
        if (self.state.f3 != null && self.state.f3!!.f2 != null && self.state.f3!!.f2!!.f1 != null) {
            dump(self.state.f3!!.f2!!.f1!!);
        }
    }
}