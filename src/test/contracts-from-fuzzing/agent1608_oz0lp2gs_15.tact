struct DeepMany {
    a: Int;
    s: Sub1;
}

struct Sub1 {
    x: Int;
    y: Sub2;
}

struct Sub2 {
    foo: Int;
    bar: Sub3;
}

struct Sub3 {
    baz: Int;
}

contract DeepManyLevels {
    val: DeepMany = DeepMany{
        a:1,
        s: Sub1{
            x:2,
            y: Sub2{
                foo:3,
                bar: Sub3{ baz: 4 }
            }
        }
    };

    init() {
        self.val = DeepMany{
            a:10,
            s: Sub1{
                x:20,
                y: Sub2{
                    foo:30,
                    bar: Sub3{ baz: 40 }
                }
            }
        };
    }
}