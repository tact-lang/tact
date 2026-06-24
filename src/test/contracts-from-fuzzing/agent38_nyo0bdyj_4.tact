contract A {
    init() {
        // Mutual recursion: A initializes B
        let bState = initOf B(100);
        let addrB = contractAddress(bState);
    }
}

contract B {
    init(val: Int) {
        // B initializes A, creating a cycle
        let aState = initOf A();
        let addrA = contractAddress(aState);
    }
}
