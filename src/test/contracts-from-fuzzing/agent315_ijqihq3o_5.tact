struct Mid {
    a: Int; 
    b: Bool;
}

struct Container {
    m1: Mid;
    m2: Mid;
    s: String; 
}

contract MidContainer {
    data: Container;
    init() {
        self.data = Container{
            m1: Mid{ a: 1, b: true },
            m2: Mid{ a: 2, b: false },
            s: "abc"
        };
    }
}