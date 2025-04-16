struct BB {
    x: Int;
    y: String?;
    z: Bool;
}

contract BigVars {
    aa: Int = 1;
    bb: Bool = true;
    cc: String = "ok";
    dd: Int?; // defaults to null
    ee: BB;
    ff: BB?;

    init() {
        self.aa = 42;
        self.bb = false;
        self.cc = "changed";
        self.dd = null;
        self.ee = BB{ x: 10, y: null, z: true };
        self.ff = null;
    }

    receive() {
        let _ = self.ee.x + (self.ff != null ? self.ff!!.x : 0);
    }
}
