struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner;
}

struct Container {
    val: Outer?;
}

contract DeepOpt {
    c: Container;

    init() {
        self.c = Container{
            val: Outer{
                bar: Inner{
                    foo: 123
                }
            }
        };
    }
}