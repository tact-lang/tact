struct Reordered {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int = 5;
    h: Bool = false;
    i: String = "default";
}

contract TestContract {
    data: Reordered;

    init() {
        self.data = Reordered{ a:1, b:true, c:"x", d:null, e:null, f:null };
    }
}