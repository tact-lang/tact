contract Recursive {
    init() {}
    
    // Recursive initialization: computing its own initial state
    get fun selfLoop(): Address {
         return contractAddress(initOf Recursive());
    }
}
