struct Mess {
    a: Int;
    b: Bool?;
    c: String;
}

struct BigMess {
    m1: Mess;
    m2: Mess;
    m3: Mess;
}

contract Test {
    big: BigMess;
    init() {
        self.big = BigMess{
            m1: Mess{ a:1, b:null, c:"a" },
            m2: Mess{ a:2, b:true, c:"b" },
            m3: Mess{ a:3, b:false, c:"c" }
        };
    }
}
