struct Defaults {
    a: Int = 5;
    b: String = "hello";
    c: Bool = true;
}

struct Wrapper {
    nested: Defaults;
    flag: Bool = false;
}

contract TestContract {
    w: Wrapper = Wrapper{
        nested: Defaults{},
        flag: false
    };

    init() {
        self.w = Wrapper{
            nested: Defaults{},
            flag: false
        };
    }
}