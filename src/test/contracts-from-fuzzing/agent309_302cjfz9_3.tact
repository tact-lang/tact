struct DeepNested {
    sub: Inner2;
}

struct Inner2 {
    a: Bool;
    b: Innermost;
}

struct Innermost {
    val: String;
}

contract DeepStorage {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            sub: Inner2{
                a: true,
                b: Innermost{ val: "hello" }
            }
        };
    }
}