struct Base {
    x: Int = 1;
    y: String = "hey";
    z: Int?;
}

struct Wrapper {
    base: Base;
    other: Int?;
}

contract DeepDefaults {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            base: Base{},
            other: null
        };
    }
}