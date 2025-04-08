struct Merged {
    i: Int;
    b: Bool;
}

contract CrossAssign {
    m1: Merged;
    m2: Merged;

    init() {
        self.m1 = Merged{i:1,b:true};
        self.m2 = Merged{i:2,b:false};
    }
}