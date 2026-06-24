struct DeepOpt {
    lv1: Int?;
    lv2: Int?;
    lv3: Int?;
}

struct Container {
    c1: DeepOpt;
    c2: DeepOpt;
}

contract MultiOptionTest {
    container: Container;

    init() {
        self.container = Container{
            c1: DeepOpt{}, c2: DeepOpt{}
        };
    }
}
