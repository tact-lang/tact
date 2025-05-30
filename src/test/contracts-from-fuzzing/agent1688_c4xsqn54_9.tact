struct InnerMost { flag: Bool; count: Int; note: String; }
struct Middle { val: Int; deep: InnerMost; }

contract DeepStruct {
    m: Middle;

    init() {
        self.m = Middle{
            val: 999,
            deep: InnerMost{
                flag: true,
                count: 100,
                note: "nested"
            }
        };
    }
}