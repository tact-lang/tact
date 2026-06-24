struct Crazy {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
    g: Deep?;
}

struct Deep {
    x: Int;
    y: Bool?;
    z: String;
}

contract TestContract {
    crazy: Crazy;

    init() {
        self.crazy = Crazy{
            a:1, b:null, c:"c", d:5, e:true, f:null,
            g: Deep{x:10, y:false, z:"deep"}
        };
    }

    receive() {}
}