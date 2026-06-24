struct SuperDeep {
    l1: Int;
    l2: Inner1;
}

struct Inner1 {
    l3: Int;
    l4: Inner2;
}

struct Inner2 {
    l5: Int;
    l6: Inner3;
}

struct Inner3 {
    l7: Int;
    l8: Inner4;
}

struct Inner4 {
    data: String;
}

contract ExtremeNesting {
    s: SuperDeep;

    init() {
        self.s = SuperDeep{
            l1:1,
            l2:Inner1{
                l3:2,
                l4:Inner2{
                    l5:3,
                    l6:Inner3{
                        l7:4,
                        l8:Inner4{
                            data:"deep"
                        }
                    }
                }
            }
        };
    }
}
