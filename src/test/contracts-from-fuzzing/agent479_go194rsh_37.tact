struct Leaf {
    tiny: Int as uint8 = 0;
    flag: Bool = false;
}

struct Middle {
    leaf: Leaf;
    note: String = "hi";
    optNum: Int? = null;
}

struct Root {
    data: Middle?;
    large: Int as int128 = 7;
}

contract SerializeMix {
    store: Root = Root{ data: null, large: 123 };

    init() {
        self.store = Root{
            data: Middle{
                leaf: Leaf{ tiny:5, flag:true },
                note: "ok",
                optNum: 55,
            },
            large: 77,
        };
    }
}