struct InnerDefault {
    x: Int = 99;
    y: Bool? = null;
}

struct Wrapper {
    embedded: InnerDefault;
    z: Int;
}

contract TestContract {
    holder: Wrapper;

    init() {
        self.holder = Wrapper{
            embedded: InnerDefault{ x: 42, y: true },
            z: 7
        };
    }
}