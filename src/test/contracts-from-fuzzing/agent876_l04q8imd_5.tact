struct DeepOptional {
    x: Int?;
}

struct Container {
    deep: DeepOptional?;
}

contract NullDefault {
    state: Container;

    init() {
        self.state = Container{
            deep: null
        };
    }

    receive() {
        if (self.state.deep != null) {
            dump(self.state.deep!!.x);
        }
    }
}