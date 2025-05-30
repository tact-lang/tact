struct Inner {
    flag: Bool = true;
    count: Int as uint16 = 7;
}

struct Outer {
    label: String = "hey";
    nested: Inner;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{flag:false,count:42},
            label: "outer",
        };
    }
}