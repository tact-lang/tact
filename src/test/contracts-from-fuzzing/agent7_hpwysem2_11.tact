trait TAlpha {
    const ALPHA: Int = 1;
}

trait TBeta {
    const BETA: Int = 2;
}

contract AB() with TAlpha, TBeta {
    receive() {
        require(self.ALPHA == 1, "ALPHA error");
        require(self.BETA == 2, "BETA error");
        cashback(sender());
    }
}
