// deep nested structs but with some empty
struct Bottom { val: Int }

struct SubB { bottom: Bottom }

struct SubA { bottom: Bottom }

struct Top {
    a: SubA;
    b: SubB;
}

contract DeepBranches {
    data: Top;

    init() {
        self.data = Top{
            a: SubA{ bottom: Bottom{ val: 1 } },
            b: SubB{ bottom: Bottom{ val: 2 } },
        };
    }
}