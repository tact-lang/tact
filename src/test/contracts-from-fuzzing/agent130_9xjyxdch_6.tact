contract ContractWithInit {
    init(x: Int) {
        // dummy initialization for state (not needed since no state variables)
    }
    receive() {}
}

contract CallerWithInitCorrect {
    receive() {
        // Correct: calling initOf with the required init parameter
        let state = initOf ContractWithInit(10);
    }
}
