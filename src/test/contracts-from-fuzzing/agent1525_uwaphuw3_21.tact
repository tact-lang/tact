struct Bottom {
    a: Int?;
    b: Bool?;
}

struct Middle {
    c: Bottom?;
}

struct Top {
    d: Middle?;
}

contract DeepOptStructs {
    val: Top;

    init() {
        self.val = Top{
            d: Middle{
                c: Bottom{
                    a: 101,
                    b: null
                }
            }
        };
    }
}