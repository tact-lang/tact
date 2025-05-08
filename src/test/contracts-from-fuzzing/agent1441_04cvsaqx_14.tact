struct Nester {
    a: Int;
    b: Bool;
    s: String?;
}

struct Wrapper {
    x: Nester;
    y: Nester?;
    flag: Bool;
}

contract Combos {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            x: Nester{a:5, b:true, s:null},
            y: null,
            flag: false,
        };
    }
}