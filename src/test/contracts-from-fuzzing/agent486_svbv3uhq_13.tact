struct Mid {
    x: Int = 2;
    y: Bool = false;
}

struct Parent {
    child: Mid;
    val: String = "";
}

contract NestedOpt {
    data: Parent?;

    init() {
        self.data = Parent{
            child: Mid{ x: 42, y: true },
            val: "hello",
        };
    }
}