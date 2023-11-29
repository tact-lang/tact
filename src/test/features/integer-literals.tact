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

    get fun hexLiteral1(): Int {
        return 0x123;
    }

    get fun hexLiteral2(): Int {
        return -0x123;
    }

    get fun binLiteral1(): Int {
        return 0b101010;
    }

    get fun binLiteral2(): Int {
        return -0b101010;
    }
}