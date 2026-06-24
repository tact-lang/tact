struct DeepEmbed {
    x: Int;
    y: String;
    z: Bool?;
}

struct Middle {
    mfield: DeepEmbed;
    val: String;
}

contract DeepNest {
    data: Middle;

    init() {
        self.data = Middle{
            mfield: DeepEmbed{
                x: 5,
                y: "deep",
                z: null
            },
            val: "hello"
        };
    }
}