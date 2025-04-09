struct CoinStruct { amount: Int as coins; }

contract TestCasting {
    receive() {
         let cs: CoinStruct = CoinStruct { amount: 42 };
         dump(cs.amount); // Expected to dump 42, cast as coins
    }
}
