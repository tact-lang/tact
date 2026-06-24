contract GetInit {
    get fun check(): Bool {
        let a = contractAddress(initOf GetInit());
        return myAddress() == a;
    }
}
