contract SimpleInit {
    receive() {
        let initState = initOf SimpleInit();
        let addr1 = myAddress();
        let addr2 = contractAddress(initState);
        // Expect addr1 == addr2 based on documentation 
    }
}