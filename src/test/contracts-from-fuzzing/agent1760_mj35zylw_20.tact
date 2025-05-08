struct A {
    foo: Int;
    bar: String;
}

struct B {
    nested: A;
    opt: Bool?;
}

struct C {
    mid: B;
    flag: Bool;
}

contract MixDeepWide {
    data1: C;
    data2: A;
    data3: B;

    init() {
        self.data1 = C{
            mid: B{
                nested: A{foo: 1, bar: "x"},
                opt: true
            },
            flag: false
        };

        self.data2 = A{foo: 2, bar: "y"};
        self.data3 = B{
            nested: A{foo: 3, bar: "z"},
            opt: null
        };
    }
}