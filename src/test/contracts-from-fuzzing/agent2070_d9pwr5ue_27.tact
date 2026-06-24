struct ContainsOpt {
    foo: Int?;
}

struct ContainsRemaining {
    bar: Slice as remaining;
}

struct NestBoth {
    c1: ContainsOpt;
    c2: ContainsRemaining;
}

contract OptAndRemaining {
    f: NestBoth;

    init() {
        self.f = NestBoth{
            c1: ContainsOpt{ foo: null },
            c2: ContainsRemaining{ bar: beginCell().endCell().asSlice() }
        };
    }
}