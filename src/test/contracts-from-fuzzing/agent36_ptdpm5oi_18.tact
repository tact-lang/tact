struct Sub {
    x: Int = 5;
    y: Bool = false;
}

struct Mid {
    label: String = "x";
    sub: Sub;
}

struct High {
    info: Mid;
    count: Int = 100;
}

contract DeepAndDefaults {
    field: High;

    init() {
        self.field = High{
            info: Mid{
                label: "override",
                sub: Sub{ x: 20, y: true }
            },
            count: 1000
        };
    }

    receive() {
        let _ = self.field;
    }
}