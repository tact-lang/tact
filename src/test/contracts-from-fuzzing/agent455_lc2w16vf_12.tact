// test optional strings, nested, and multiple levels

struct Lvl3 {
    s3: String?;
}

struct Lvl2 {
    s2: String?;
    l3: Lvl3?;
}

struct Lvl1 {
    s1: String?;
    l2: Lvl2?;
}

contract MultiLevel {
    data: Lvl1;

    init() {
        self.data = Lvl1{
            s1: "a",
            l2: Lvl2{
                s2: "b",
                l3: Lvl3{s3: "c"},
            },
        };
    }
}