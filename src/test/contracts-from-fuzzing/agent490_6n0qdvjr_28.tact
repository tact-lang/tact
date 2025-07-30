struct Mix {
    n: Int;
    s: String;
    f: Bool;
}

contract MultiType {
    x: Mix;
    init() {
        self.x = Mix{ n:1, s:"x", f:true };
    }
}