struct Level1 { foo: Int; bar: Bool; }
struct Level2 { nested: Level1; txt: String; }
struct Level3 { nested2: Level2; cellVal: Cell; }
struct Level4 { nested3: Level3; extra: Slice; }

contract FourNestLayers {
    data: Level4;

    init() {
        self.data = Level4{
            nested3: Level3{
                nested2: Level2{
                    nested: Level1{ foo: 1, bar: false },
                    txt: "x"
                },
                cellVal: emptyCell()
            },
            extra: emptyCell().asSlice()
        };
    }
}