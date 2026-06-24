struct Bottom {
    x: Int? = null;
}

struct Middle {
    bottom: Bottom;
}

contract OptDefaultOverride {
    data: Middle;

    init() {
        self.data = Middle{
            bottom: Bottom{x: 123}
        };
    }
}