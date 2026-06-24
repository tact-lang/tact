struct Mix {
    x: Int;
    y: Bool;
    z: String;
}

contract TestContract {
    m1: Mix;
    m2: Mix;

    init() {
        self.m1 = Mix{x:1,y:true,z:"hi"};
        self.m2 = Mix{x:2,y:false,z:"bye"};
    }

    receive() {}
}