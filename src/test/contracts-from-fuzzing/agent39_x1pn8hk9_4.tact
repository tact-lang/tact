contract Level1 {
    init() {}
}

contract Level2 {
    init() {
       let s = initOf Level1();
    }
}

contract Level3 {
    init() {
        let s2 = initOf Level2();
    }
}

contract Top {
    receive() {
        let s3 = initOf Level3();
        let a = contractAddress(s3);
    }
}
