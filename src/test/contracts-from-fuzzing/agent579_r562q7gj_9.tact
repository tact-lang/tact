struct Child {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Middle {
    child: Child?;
    label: String;
}

struct Top {
    middle: Middle?;
    done: Bool;
}

contract DeepOptLayers {
    data: Top;

    init() {
        self.data = Top{
            middle: Middle{
                child: Child{ x: null, y: true, z: null },
                label: "ok"
            },
            done: false
        };
    }
}