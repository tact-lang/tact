struct Wrap1 { val: Int; }
struct Wrap2 { wrap: Wrap1; }
struct Wrap3 { wrap: Wrap2; }
struct Wrap4 { wrap: Wrap3; }
struct Wrap5 { wrap: Wrap4; }
struct Wrap6 { wrap: Wrap5; }

contract TestDeepWrap {
    x: Wrap6;

    init() {
        self.x = Wrap6{wrap: Wrap5{wrap: Wrap4{wrap: Wrap3{wrap: Wrap2{wrap: Wrap1{val: 101}}}}}};
    }
}