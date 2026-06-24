struct NestA { a: Int; }
struct NestB { b: String; }
struct NestC { c: Bool; }

struct Holder {
    na: NestA;
    nb: NestB;
    nc: NestC;
}

contract SeparateNested {
    state: Holder;

    init() {
        self.state = Holder{
            na: NestA{ a: 1 },
            nb: NestB{ b: "s" },
            nc: NestC{ c: true },
        };
    }
}