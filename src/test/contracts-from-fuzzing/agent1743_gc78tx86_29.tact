struct X1 { a: Int; }
struct X2 { b: Int; }
struct X3 { c: Int; }
struct X4 { d: Int; }
struct X5 { e: Int; }

struct TopLevel {
    x1: X1?;
    x2: X2?;
    x3: X3?;
    x4: X4?;
    x5: X5?;
}

contract OptionStructs {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            x1:null,
            x2:null,
            x3:null,
            x4:null,
            x5:null,
        };
    }
}