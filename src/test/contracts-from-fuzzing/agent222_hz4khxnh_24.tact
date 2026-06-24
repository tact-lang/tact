struct SI {
    x: Int;
}

struct SB {
    x: Bool;
}

struct SS {
    x: String;
}

contract ThreeStructFields {
    a: SI = SI{x: 1};
    b: SB = SB{x: false};
    s: SS = SS{x: "abc"};

    receive() {
        self.a = SI{x:10};
        self.b = SB{x:true};
        self.s = SS{x:"def"};
    }
}