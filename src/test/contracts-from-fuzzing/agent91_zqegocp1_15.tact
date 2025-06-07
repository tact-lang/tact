struct Tiny {
    x: Int;
}
struct Middle {
    a: Tiny;
    b: Tiny;
}
struct Container {
    one: Middle;
    two: Middle;
    opt: Middle?;
}

contract Storage {
    big: Container;

    init() {
        self.big = Container{
            one: Middle{a:Tiny{x:1}, b:Tiny{x:2}},
            two: Middle{a:Tiny{x:3}, b:Tiny{x:4}},
            opt: null
        };
    }
}