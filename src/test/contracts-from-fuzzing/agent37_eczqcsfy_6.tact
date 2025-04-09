struct LevelTwo {
    foo: Int = 5;
}

struct LevelOne {
    innerOpt: LevelTwo?;
}

contract TestContract {
    nested: LevelOne;

    init() {
        self.nested = LevelOne{ innerOpt: null };
    }

    receive() {
        if (self.nested.innerOpt != null) {
            dump(self.nested.innerOpt!!.foo);
        }
    }
}