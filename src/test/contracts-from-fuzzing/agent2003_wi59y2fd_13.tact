// optional struct nested deeper inside another optional field
struct InnerMost { a: Int; }

struct Middle { innerOpt: InnerMost?; }

struct Outer {
    middleOpt: Middle?;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middleOpt: null,
            flag: true,
        };
    }
}
