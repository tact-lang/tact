// deeply nested optional inside struct inside struct
struct MostInner {
    a: Int?;
}

struct Middle {
    nested: MostInner?;
}

struct Wrapper {
    middle: Middle?;
}

contract TestContract {
    val: Wrapper;
    init() {
        self.val = Wrapper{
            middle: Middle{
                nested: MostInner{
                    a: null,
                },
            },
        };
    }
}