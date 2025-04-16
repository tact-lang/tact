struct DefaultedNested {
    x: Int = 1;
    y: Bool?;
}

struct Container {
    n: DefaultedNested;
    z: String = "default";
}

contract DefaultsTest {
    data: Container;

    init() {
        self.data = Container{
            n: DefaultedNested{ y: null },
            z: "override"
        };
    }
}
