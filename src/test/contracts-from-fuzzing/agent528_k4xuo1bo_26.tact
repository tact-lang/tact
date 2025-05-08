struct Embedded {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    f1: Int;
    embed: Embedded;
    f2: String;

    init() {
        self.f1 = 5;
        self.embed = Embedded{x:1,y:true,z:"ok"};
        self.f2 = "done";
    }
}