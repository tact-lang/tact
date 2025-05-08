message(0x42) MM {
    foo: Int as uint4;
}

contract C {
    mm: MM;

    init() {
       self.mm = MM { foo: 15 };
    }

    receive() {}
}