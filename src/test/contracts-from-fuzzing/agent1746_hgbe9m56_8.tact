struct Deep1 { val: Int; }
struct Deep2 { f: Deep1; }
struct Deep3 { f: Deep2; }
struct Deep4 { f: Deep3; }
struct Deep5 { f: Deep4; }
struct Deep6 { f: Deep5; }
struct Deep7 { f: Deep6; }
struct Deep8 { f: Deep7; }
struct Deep9 { f: Deep8; }
struct Deep10 { f: Deep9; }

contract DeepContract {
    deep: Deep10;

    init() {
        self.deep = Deep10{ f: Deep9{ f: Deep8{ f: Deep7{ f: Deep6{ f: Deep5{ f: Deep4{ f: Deep3{ f: Deep2{ f: Deep1{ val:1 }}}}}}}}}};
    }
}
