struct Sub {
    x: Int;
    y: Bool;
}

struct Mid {
    m: Sub;
    n: Int?;
}

struct Main {
    inner: Mid;
    z: String;
}

contract Complex {
    store: Main = Main{
        inner: Mid{m: Sub{x: 1, y:true}, n:null},
        z: "zzz"
    };
}
