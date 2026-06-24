struct Level0 {
    a: Int;
    b: Bool;
    c: Level1;
}

struct Level1 {
    s: String;
    d: Level2;
}

struct Level2 {
    f: Int;
    g: Bool;
}

contract MultiLev {
    val: Level0;

    init() {
        self.val = Level0{
            a:1,
            b:false,
            c: Level1{
                s:"x",
                d: Level2{
                    f:100,
                    g:true
                }
            }
        };
    }
}
