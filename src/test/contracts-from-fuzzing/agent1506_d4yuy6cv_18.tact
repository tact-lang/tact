struct VeryDeep {
    l1: Int;
    l2: Int;
    l3: Int;
    l4: Int;
    l5: Int;
    l6: Int;
    l7: Int;
    l8: Int;
    l9: Int;
    l10: Int;
}

contract DeepManyFields {
    a: VeryDeep;
    b: VeryDeep;
    c: VeryDeep;

    init() {
        self.a = VeryDeep{
            l1:1,l2:2,l3:3,l4:4,l5:5,l6:6,l7:7,l8:8,l9:9,l10:10
        };
        self.b = self.a;
        self.c = self.b;
    }
}
// persistent with multiple very large nested structs repeated