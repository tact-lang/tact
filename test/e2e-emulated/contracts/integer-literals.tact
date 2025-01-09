contract IntegerLiteralsTester {

    init() {
        
    }
    
    receive() {
        // Deploy
    }

    get fun decLiteral1(): Int {
        return 123;
    }

    get fun decLiteral2(): Int {
        return -123;
    }

    get fun decLiteral3(): Int {
        return 1_0123_00_000;
    }

    get fun hexLiteral1(): Int {
        return 0x123;
    }

    get fun hexLiteral2(): Int {
        return -0x123;
    }

    get fun hexLiteral3(): Int {
        return 0x1_0123_00_000;
    }

    get fun binLiteral1(): Int {
        return 0b101010;
    }

    get fun binLiteral2(): Int {
        return -0b101010;
    }

    get fun binLiteral3(): Int {
        return 0b1_0101_00_000;
    }

    get fun octLiteral1(): Int {
        return 0o123;
    }

    get fun octLiteral2(): Int {
        return -0o123;
    }

    get fun octLiteral3(): Int {
        return 0o1_0123_00_000;
    }
}