struct Inner {
    score: Int = 100;
    label: String?;
}

struct Outer {
    enabled: Bool = true;
    child: Inner;
    comment: String?;
}

contract PersistentNested {
    data: Outer = Outer{
        enabled: false,
        child: Inner{ score: 5, label: "lvl1" },
        comment: null
    };

    init() {
        self.data = Outer{
            enabled: true,
            child: Inner{ score: 99, label: null },
            comment: "done"
        };
    }
}