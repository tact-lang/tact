struct SubStruct { a: Int; b: Bool; c: String; }

struct MidStruct { x: Int; nested: SubStruct; y: Bool; z: String; }

struct OuterStruct { first: MidStruct; second: Bool; third: String; fourth: Int; }

contract DeepNested {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            first: MidStruct{
                x: 10,
                nested: SubStruct{ a: 1, b: true, c: "sub" },
                y: false,
                z: "mid"
            },
            second: true,
            third: "outer",
            fourth: 42
        };
    }
}
