struct One {
    x: Int;
}

struct Two {
    x: Int;
}

struct Three {
    x: Int;
}

struct Four {
    x: Int;
}

contract ManyNestedFields {
    f1: One;
    f2: Two;
    f3: Three;
    f4: Four;

    init() {
        self.f1=One{x:1};self.f2=Two{x:2};self.f3=Three{x:3};self.f4=Four{x:4};
    }
}