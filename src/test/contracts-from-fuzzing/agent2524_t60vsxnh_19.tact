struct Part {
    val: Int = 42;
    flag: Bool?;
}

struct Whole {
    p: Part;
    info: String;
}

contract MixedInit {
    data: Whole;

    init() {
        // p.val inherited default, override entire p
        self.data = Whole{
            p: Part{ val: 100, flag: null },
            info: "hello"
        };
    }
}