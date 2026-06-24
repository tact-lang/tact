struct Layered {
    lvl1: Int;
    lvl2: Int;
    lvl3: Int;
    flag1: Bool;
    flag2: Bool;
}

contract MixLayered {
    info: Layered;
    ready: Bool = true;

    init() {
        self.info = Layered { lvl1: 1, lvl2: 2, lvl3: 3, flag1: true, flag2: false };
        self.ready = false;
    }

    receive() {
        if (self.ready) {
            let _ = self.info.lvl2;
        }
    }
}