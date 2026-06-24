struct Container {
    c: Int as coins;
}

contract TestCoins2 {
    receive() {
        let con = Container {
            c: -1  // Testing negative literal in a coins field
        };
    }
}