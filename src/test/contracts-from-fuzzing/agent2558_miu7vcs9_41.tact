struct Wrap1 {
    a: Int;
}

struct Wrap2 {
    b: Wrap1;
}

struct Wrap3 {
    c: Wrap2;
}

contract DeepWrap {
    val: Wrap3;

    init() {
        self.val = Wrap3{
            c: Wrap2{
                b: Wrap1{
                    a: 42
                }
            }
        };
    }
}