struct DeepTuple {
    a: Int;
    b: TupleB;
}

struct TupleB {
    c: Int;
    d: TupleC;
}

struct TupleC {
    e: Int;
    f: TupleD;
}

struct TupleD {
    g: Int;
    h: Int;
}

contract DeeplyNested {
    data: DeepTuple;

    init() {
        self.data = DeepTuple{
            a:1,
            b: TupleB{
                c:2,
                d: TupleC{
                    e:3,
                    f: TupleD{
                        g:4,
                        h:5
                    }
                }
            }
        };
    }
}