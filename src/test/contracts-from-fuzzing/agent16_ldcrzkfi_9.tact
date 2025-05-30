struct Inner1 {
    x: Int;
}

struct Inner2 {
    y: Inner1;
}

struct Inner3 {
    z: Inner2;
}

struct Middle {
    m: Inner3;
}

struct Top {
    t: Middle;
}

contract DeepChain {
    s: Top;

    init() {
        self.s = Top{
            t: Middle{
                m: Inner3{
                    z: Inner2{
                        y: Inner1{ x: 5 }
                    }
                }
            }
        };
    }
}