message(9) MTest { value: Int }

struct Container {
    msg: MTest?;
}

contract OptMessageInsideStruct {
    storage: Container;

    init() {
        self.storage = Container{ msg: null };
    }
}