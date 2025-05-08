struct OptionalDeep {
    part1: Int?;
    part2: Deeper?;
}

struct Deeper {
    foo: Int?;
    bar: String?;
}

contract OptionalDeepStore {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            part1: null,
            part2: null
        };
    }
}