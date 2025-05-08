struct Middle {
    i: Int;
    optS: String?;
    flag: Bool = false;
}

struct Wrapper {
    data: Middle;
}

contract NestedDefaults {
    x: Wrapper;

    init() {
        self.x = Wrapper{
            data: Middle{
                i: 42,
                optS: null,
                // flag defaults to false
            }
        };
    }
}
