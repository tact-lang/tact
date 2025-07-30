struct Compose {
    i1: Int;
    txt: String;
}

struct Container {
    part1: Compose;
    part2: Compose;
    flag: Bool;
}

contract MultiCompose {
    storage: Container;

    init() {
        self.storage = Container{
            part1: Compose{
                i1: 1,
                txt: "hello",
            },
            part2: Compose{
                i1: 2,
                txt: "bye",
            },
            flag: true,
        };
    }
}