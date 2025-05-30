struct SOpt {
    foo: Int?;
}

contract OptDefaultInit {
    s: SOpt;

    init() {
        self.s = SOpt{ foo: null };
    }

    receive() {
        let _= self.s;
    }
}