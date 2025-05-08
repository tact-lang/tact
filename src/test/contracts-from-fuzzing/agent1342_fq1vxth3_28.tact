struct Sub1 { x: Int }
struct Sub2 { y: Int }

struct Container {
    s1: Sub1;
    s2: Sub2;
    flag: Bool?;
}

contract MultipleContainers {
    f: Container;

    init() {
        self.f = Container{
            s1: Sub1{ x: 1 },
            s2: Sub2{ y: 2 },
            flag: true
        };
    }
}