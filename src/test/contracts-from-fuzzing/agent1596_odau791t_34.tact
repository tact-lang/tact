struct Opt1 { a: Int?; }
struct Opt2 { b: Opt1?; }
struct Opt3 { c: Opt2?; }
struct Opt4 { d: Opt3?; }
contract ChainOptionals {
    f: Opt4 = Opt4{ d: null };
    receive() {
        let _ = self.f.d;
    }
}