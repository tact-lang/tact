contract TheKingPrawn {
    receive("keeping the address") {
        let myAddr1 = myAddress();
        let myAddr2 = contractAddress(initOf TheKingPrawn());
        myAddr1 == myAddr2;
    }
}
