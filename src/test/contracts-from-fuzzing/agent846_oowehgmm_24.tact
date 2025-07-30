// nested struct with many bools
struct Flags {
    f0: Bool;
    f1: Bool;
    f2: Bool;
    f3: Bool;
    f4: Bool;
    f5: Bool;
    f6: Bool;
    f7: Bool;
     
}

struct Wrapper {
    wrap: Flags;
}

contract Test {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            wrap: Flags{
                f0: true, f1: false, f2: true, f3: false,
                f4: true, f5: false, f6: true, f7: false
            }
        };
    }
}