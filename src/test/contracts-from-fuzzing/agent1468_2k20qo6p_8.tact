struct Container {
    nested1: Inner1;
    nested2: Inner2;
}

struct Inner1 {
    flag1: Bool;
    flag2: Bool;
}

struct Inner2 {
    txt: String;
    num: Int;
}

contract TestMultiNested {
    data: Container;

    init() {
        self.data = Container{
            nested1: Inner1{
                flag1: true,
                flag2: false,
            },
            nested2: Inner2{
                txt: "hi",
                num: 42,
            },
        };
    }
}
