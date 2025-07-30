struct One { f1: Int; }
struct Two { f2: Int; }
struct Three { f3: Int; }
struct Four { f4: Int; }
struct Five { f5: Int; }

contract ManyStructsFields {
    o: One;
    t: Two;
    th: Three;
    f: Four;
    fi: Five;

    init() {
        self.o = One{ f1:1 };
        self.t = Two{ f2:2 };
        self.th = Three{ f3:3 };
        self.f = Four{ f4:4 };
        self.fi = Five{ f5:5 };
    }
}