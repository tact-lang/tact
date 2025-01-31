//@ { "external": true }
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

    get fun getA(): Int {
        return self.a;
    }
}