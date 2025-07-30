struct A {
    i1: Int;
    i2: Bool;
    i3: Int?;
    i4: Bool?;
    s: SubA;
}

struct SubA {
    sub_i1: Int;
    sub_b1: Bool;
    sub_opt: Int?;
}

contract TestOpt {
    data: A;

    init() {
        self.data = A{
            i1: 1,
            i2: true,
            i3: null,
            i4: false,
            s: SubA{
                sub_i1: 4,
                sub_b1: false,
                sub_opt: null
            }
        };
    }
}