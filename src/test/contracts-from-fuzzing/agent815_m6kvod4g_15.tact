struct InnerMost { z: Int; }
struct MidLevel { inner: InnerMost; flag: Bool; }
struct TopLevel { mid: MidLevel; text: String; }

contract VeryNested {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            mid: MidLevel{
                inner: InnerMost{z: 42},
                flag: true
            },
            text: "deep"
        };
    }
}