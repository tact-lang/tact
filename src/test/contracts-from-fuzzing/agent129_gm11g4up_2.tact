contract Simple {
    init() {
        // no initialization code
    }
    receive() {}
}

contract TestInit {
    receive() {
        // Valid usage of initOf with a contract with an explicit init()
        let st = initOf Simple();
    }
}
