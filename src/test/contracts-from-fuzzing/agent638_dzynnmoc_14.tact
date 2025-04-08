struct Ex {
    val: Int = 1;
}

struct Container {
    exVal: Ex? = Ex{};
}

contract NullOverrideDefault {
    c: Container = Container{ exVal: Ex{} };

    init() {
        self.c = Container{ exVal: null };
    }
}