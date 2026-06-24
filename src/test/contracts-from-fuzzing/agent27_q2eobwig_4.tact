trait Base {
    fun bar(): Int {
        return 10;
    }
}

trait Derived with Base {
    override fun bar(): Int {
        return 20;
    }
}

contract Test() with Derived {
    receive() {
        let x = self.bar();
        dump(x);
    }
}
