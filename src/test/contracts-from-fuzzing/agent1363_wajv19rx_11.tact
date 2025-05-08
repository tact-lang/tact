struct Bottom {
    val: Int? = null;
    txt: String = "end";
}

struct Middle {
    inBottom: Bottom? = null;
    flag: Bool = true;
}

struct Top {
    mid: Middle? = null;
    name: String = "top";
}

contract OptionalDefaultsDeep {
    data: Top;

    init() {
        self.data = Top{
            mid: Middle{
                inBottom: Bottom{
                    val: 55,
                    txt: "deepest",
                },
                flag: false
            },
            name: "override"
        };
    }
}