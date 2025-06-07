// contract persistent variable which is optional of struct that contains optional of struct
struct DeepInner {
    x: Int = 1;
}

struct Outer {
    nested: DeepInner?;
}

contract EmbOpt {
    val: Outer?;
    init() {
        self.val = Outer {
            nested: DeepInner { x: 777 }
        };
    }
}
