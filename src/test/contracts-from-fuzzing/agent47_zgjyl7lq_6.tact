struct ResultDiamond { m: Int; X: Int; }

trait T1 {
    virtual fun m(): Int {
        return 1;
    }
    virtual const X: Int = 100;
}

trait T2 {
    virtual fun m(): Int {
        return 2;
    }
    virtual const X: Int = 200;
}

contract Diamond() with T1, T2 {
    override fun m(): Int {
        return 3;
    }
    override const X: Int = 300;
    get fun testDiamond(): ResultDiamond {
        return ResultDiamond{ m: self.m(), X: self.X };
    }
}
