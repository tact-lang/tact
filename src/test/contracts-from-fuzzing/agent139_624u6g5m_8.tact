struct MultiLevel1 { a: Int; b: String; }
struct MultiLevel2 { c: Bool; d: MultiLevel1; }
struct MultiLevel3 { e: Bool; f: MultiLevel2; }

contract DeepThreeLevel {
    nest: MultiLevel3;

    init() {
        self.nest = MultiLevel3{
            e: true,
            f: MultiLevel2{
                c: false,
                d: MultiLevel1{ a: 2, b: "x" }
            }
        };
    }
}