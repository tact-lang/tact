struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    val: NestedOptionals?;
}

contract OptInOpt {
    data: Container;

    init() {
        self.data = Container{
            val: null
        };
    }
}