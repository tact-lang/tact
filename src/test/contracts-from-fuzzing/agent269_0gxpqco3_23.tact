struct Commonly {
    num: Int = 1;
    flag: Bool = false;
    text: String = "x";
}

contract MultiInst {
    a: Commonly = Commonly{};
    b: Commonly = Commonly{};
    c: Commonly = Commonly{};

    init() {
        self.a = Commonly{ num: 5, flag:true, text:"A" };
        self.c = Commonly{ num: 6, flag:false, text:"C" };
    }
}