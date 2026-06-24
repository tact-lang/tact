struct DeepNested {
    s: Inner;
    flag: Bool;
}

struct Inner {
    val: Int;
    text: String;
}

contract DeepStructTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            s: Inner{val: 7, text: "nested"},
            flag: false
        };
    }
}