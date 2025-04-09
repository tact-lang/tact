trait Base {
    fun a(): Int {
        return 10;
    }
}

trait Derived1 with Base {
    // b calls a from the Base
    fun b(): Int {
        return self.a() + 5;
    }
}

trait Derived2 with Base {
    // c calls a from the Base
    fun c(): Int {
        return self.a() * 2;
    }
}

contract Diamond() with Derived1, Derived2 {
    // Override the function a() to resolve diamond and override Base::a()
    override fun a(): Int {
        return 30;
    }

    receive() {
        let x = self.b(); // expected: 30 + 5 = 35
        let y = self.c(); // expected: 30 * 2 = 60
        if (x != 35 || y != 60) {
            throw(1);
        }
        cashback(sender());
    }
}
