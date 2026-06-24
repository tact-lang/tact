struct RecursiveNest1 {
    flag: Bool;
}

struct RecursiveNest2 {
    child: RecursiveNest1?;
}

struct RecursiveNest3 {
    child: RecursiveNest2?;
}

struct RecursiveNest4 {
    child: RecursiveNest3?;
}

contract RecursiveOptionalChains {
    data: RecursiveNest4;

    init() {
        self.data = RecursiveNest4{ child: null };
    }
}