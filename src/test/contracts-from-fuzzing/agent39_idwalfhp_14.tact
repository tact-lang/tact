struct Mix {
    i: Int;
    b: Bool;
    s: String;
}

contract MultiType {
    mi: Mix;
    boo: Bool;
    val: Int;
    txt: String;

    init() {
        self.mi = Mix{ i: 1, b: true, s: "hi" };
        self.boo = false;
        self.val = 55;
        self.txt = "hello";
    }
}