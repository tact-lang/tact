struct Lvl3 {
    z: String;
}

struct Lvl2 {
    inner3: Lvl3;
    flag: Bool;
}

struct Lvl1 {
    inner2: Lvl2;
    count: Int;
}

contract MultiLayer {
    data: Lvl1;
    init() {
        self.data = Lvl1{
            inner2: Lvl2{inner3: Lvl3{z: "x"}, flag: false},
            count: 99,
        };
    }
}