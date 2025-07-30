struct X1 { a:Int; }
struct X2 { b:X1; }
struct X3 { c:X2; }
struct X4 { d:X3; }
struct X5 { e:X4; }
struct X6 { f:X5; }
struct X7 { g:X6; }

contract SevenLevels {
    storage: X7;

    init() {
        self.storage = X7{g:X6{f:X5{e:X4{d:X3{c:X2{b:X1{a:100}}}}}}};
    }
}