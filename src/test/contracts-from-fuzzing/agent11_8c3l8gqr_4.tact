contract Recursive {
    init() {
         // Recursive initOf call on the same contract
         let selfInit = initOf Recursive();
    }

    receive() {}
}
