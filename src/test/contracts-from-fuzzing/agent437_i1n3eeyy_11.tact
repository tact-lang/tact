struct Middle {
    z: Int = 3;
}

struct Wrapper {
    w: Int = 1;
    m1: Middle = Middle{};
    m2: Middle = Middle{};
    m3: Middle = Middle{};
}

contract ManyNested {
    storage: Wrapper = Wrapper{};

    init() {
        self.storage = Wrapper{
            w: 100,
            m1: Middle{z: 101},
            m2: Middle{z: 102},
            m3: Middle{z: 103}
        };
    }

    receive() {
        let _ = self.storage.m2.z;
    }
}