struct DeepMost { deepVal: Int?; }
struct Middle { midVal: Bool; deep: DeepMost; }
struct Top { topVal: String; nested: Middle; }

contract VeryDeepOptionals {
    data: Top;
    init() {
        self.data = Top{
            topVal: "ok",
            nested: Middle {
                midVal: false,
                deep: DeepMost{ deepVal: null },
            }
        };
    }
}