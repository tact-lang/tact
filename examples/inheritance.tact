trait VirtualTrait {

    const b: Int = 20;

    virtual const b2: Int = 40;

    virtual fun execute(): Int {
        return 0;
    }
}

trait AbstractTrait {

    const c: Int = 30;

    abstract const c2: Int;

    abstract fun executeAbs(): Int;

    fun loadC2(): Int {
        return self.c2;
    }
}

contract Contract with VirtualTrait, AbstractTrait {

    const a: Int = 10;

    override const c2: Int = 50;

    init() {}
    
    override fun executeAbs(): Int {
        return 1000;
    }

    override fun execute(): Int {
        return 2;
    }

    get fun ex(): Int {
        return self.execute();
    }

    get fun ex2(): Int {
        return self.executeAbs();
    }

    get fun const1(): Int {
        return self.a;
    }

    get fun const2(): Int {
        return self.b;
    }

    get fun const3(): Int {
        return self.c;
    }

    get fun const4(): Int {
        return self.b2;
    }

    get fun const5(): Int {
        return self.loadC2();
    }
}