struct Inner {
    x: Int;
}

struct Wrapper {
    content: Inner?;
}

contract ManyOptionals {
    a: Wrapper?;
    b: Wrapper?;
    c: Wrapper?;
    d: Wrapper?;
    e: Wrapper?;

    init() {
        self.a = null;
        self.b = Wrapper{content: null};
        self.c = null;
        self.d = Wrapper{content: Inner{x: 1}};
        self.e = null;
    }
}