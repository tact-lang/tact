struct DeepNest1 {
    inner: DeepNest2;
}

struct DeepNest2 {
    inner: DeepNest3;
}

struct DeepNest3 {
    inner: DeepNest4;
}

struct DeepNest4 {
    inner: DeepNest5;
}

struct DeepNest5 {
    flag: Bool;
}

contract DeepTest {
    d: DeepNest1;

    init() {
        self.d = DeepNest1 {
            inner: DeepNest2 {
                inner: DeepNest3 {
                    inner: DeepNest4 {
                        inner: DeepNest5 { flag: true }
                    }
                }
            }
        };
    }
}