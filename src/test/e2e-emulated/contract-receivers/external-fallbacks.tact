message Add {
    x: Int as uint32;
}

contract ExternalFallbacksTester {
    a: Int;

    init() {
        self.a = 100;
    }

    receive() {
        // Deploy
    }

    receive(msg: Add) {
        self.a += msg.x;
    }

    external() {
        acceptMessage();
        self.a += 100;
    }

    external(msg: Add) {
        acceptMessage();
        self.a += msg.x;
    }

    external(s: Slice) {
        acceptMessage();
        self.a += 100;
    }

    get fun getA(): Int {
        return self.a;
    }
}
