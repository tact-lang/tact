struct Triple {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyTriples {
    t1: Triple;
    t2: Triple;
    t3: Triple;
    t4: Triple;

    init() {
        self.t1 = Triple{a:1, b:true, c:"a"};
        self.t2 = Triple{a:2, b:false, c:"b"};
        self.t3 = Triple{a:3, b:true, c:"c"};
        self.t4 = Triple{a:4, b:false, c:"d"};
    }

    receive() {
        let _ = self.t1;
        let _ = self.t2;
        let _ = self.t3;
        let _ = self.t4;
    }
}
