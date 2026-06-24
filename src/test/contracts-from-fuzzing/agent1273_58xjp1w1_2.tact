struct Inner {
    flag: Bool;
}

struct Outer {
    data: Int;
    nested: Inner;
}

contract DeepStructTest {
    value: Outer;

    init() {
        self.value = Outer{data:42, nested: Inner{flag:true}};
    }
}