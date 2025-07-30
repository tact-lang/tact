struct Mix {
    i: Int;
    o: Int?;
    b: Bool;
    ob: Bool?;
    s: String;
    os: String?;
}

contract TestContract {
    m: Mix;

    init() {
        self.m = Mix{ i:1, o:null, b:true, ob:null, s:"x", os:null };
    }
}