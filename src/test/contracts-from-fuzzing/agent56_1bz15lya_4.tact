trait Base {
    fun baseFun(): Int {
        return 3;
    }
}

trait Derived with Base {
    fun derivedFun(): Int {
        return self.baseFun() + 4;
    }
}

contract Test() with Derived, Base {
    // Override baseFun to provide a new value
    override fun baseFun(): Int {
        return 7;
    }

    // Getter function that returns the result of derivedFun
    // Expected: derivedFun() = baseFun() + 4 = 7 + 4 = 11
    get fun result(): Int {
        return self.derivedFun();
    }
}
