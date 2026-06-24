contract SelfReferential {
    init() {
         // Test direct self-recursive initOf call
         let state = initOf SelfReferential();
         // Using the computed state to compute an address
         let addr = contractAddress(state);
    }
}
