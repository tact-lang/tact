trait TraitX {
    const num: Int = 10;
}

trait TraitY {
    const num: Int = 20;
}

contract Test() with TraitX, TraitY {
    override const num: Int = 10;

    receive() {
        let n = self.num;
        require(n == 10, "Unexpected num value");
    }
}
