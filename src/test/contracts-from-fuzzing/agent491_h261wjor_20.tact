struct LevelA { foo: Int; }
struct LevelB { bar: Bool; }
struct LevelC { baz: Address; }
struct LevelD { qux: Cell; }
struct LevelE { quux: Slice; }
struct LevelF { corge: String; }

struct Container {
    a: LevelA;
    b: LevelB;
    c: LevelC;
    d: LevelD;
    e: LevelE;
    f: LevelF;
}

contract Multiplex {
    payload: Container;
    init() {
        self.payload = Container{
            a: LevelA{ foo: 1 },
            b: LevelB{ bar: false },
            c: LevelC{ baz: myAddress() },
            d: LevelD{ qux: emptyCell() },
            e: LevelE{ quux: emptyCell().asSlice() },
            f: LevelF{ corge: "string" },
        };
    }
}