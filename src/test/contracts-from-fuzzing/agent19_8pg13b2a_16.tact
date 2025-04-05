struct CoinWrapper {
    value: Int as uint8;
}

contract TestCasting {
    receive() {
       let a: CoinWrapper = CoinWrapper { value: 50 };
       dump(a.value);
    }
}
