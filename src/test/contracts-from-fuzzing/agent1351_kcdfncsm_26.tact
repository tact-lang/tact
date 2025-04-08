struct X1 { a:Int }
struct X2 { b:Int }
struct X3 { c:Int }
struct X4 { d:Int }
struct X5 { e:Int }

struct Group {
    one:X1;
    two:X2;
    three:X3;
    four:X4;
    five:X5;
}

contract ManyNested {
    g: Group;

    init() {
        self.g = Group{
            one:X1{a:1},
            two:X2{b:2},
            three:X3{c:3},
            four:X4{d:4},
            five:X5{e:5}
        };
    }
}