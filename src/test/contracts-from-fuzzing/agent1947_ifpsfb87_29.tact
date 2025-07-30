struct Innest1 {
    val: Int?;
}

struct Innest2 {
    i1: Innest1?;
}

struct Innest3 {
    i2: Innest2?;
}

contract Chain3Opt {
    data: Innest3;
    init() {
        self.data = Innest3{
            i2: Innest2{
                i1: null,
            },
        };
    }
}