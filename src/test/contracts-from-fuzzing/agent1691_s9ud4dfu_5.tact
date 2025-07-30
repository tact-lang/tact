struct Deep2 {
    foo: Deep1;
}

struct Deep1 {
    foo: Deep0;
}

struct Deep0 {
    x: Int;
}

contract VeryDeepNestTest {
    bar: Deep2;

    init() {
        self.bar = Deep2{
            foo: Deep1{
                foo: Deep0{
                    x: 123
                }
            }
        };
    }
}