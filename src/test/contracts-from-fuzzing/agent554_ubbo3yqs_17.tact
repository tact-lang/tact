struct Deep {
    s: SubDeep;
}

struct SubDeep {
    i: Int;
    c: SubSubDeep;
}

struct SubSubDeep {
    s: String;
    a: Address;
}

contract DeepField {
    d: Deep;

    init() {
        self.d = Deep{
            s: SubDeep{
                i:7,
                c: SubSubDeep{
                    s:"X",
                    a:myAddress()
                }
            }
        };
    }
}