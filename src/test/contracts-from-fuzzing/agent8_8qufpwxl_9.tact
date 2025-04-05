trait T1c {
    const VAL: Int = 100;
}

trait T2c {
    const VAL: Int = 200;
}

contract D() with T1c, T2c {
    // Must explicitly override the conflicting constant
    override const VAL: Int = 300;

    receive() {
        let v = self.VAL; // Expected to be 300
        return;
    }
}
