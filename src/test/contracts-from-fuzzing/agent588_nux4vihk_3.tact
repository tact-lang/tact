struct S1 {
    x: Int;
    y: Int?;
}

struct S2 {
    flag: Bool;
    info: String?;
}

struct Mega {
    part1: S1;
    part2: S2;
    done: Bool = false;
}

contract TestComposite {
    state: Mega;

    init() {
        self.state = Mega{
            part1: S1{ x: 10, y: null },
            part2: S2{ flag: true, info: "ok" },
            done: true
        };
    }

    receive() {
        let _ = self.state.part2.info;
    }
}