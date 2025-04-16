struct Opt1 { f: Int?; }
struct Opt2 { f: Opt1?; }
struct Opt3 { f: Opt2?; }
struct Opt4 { f: Opt3?; }

contract TestContract {
    deepopt: Opt4;

    init() {
        self.deepopt = Opt4{
            f: Opt3{
                f: Opt2{
                    f: Opt1{
                        f: null
                    }
                }
            }
        };
    }
}