trait T1 {
    // Abstract constant Y
    abstract const Y: Int;
}

trait T2 {
    // Virtual constant Y with default value 5
    virtual const Y: Int = 5;
}

contract C() with T1, T2 {
    // Must override the conflicting constant
    override const Y: Int = 7;

    receive() {
         let result = self.Y; // Expect result to be 7
         return;
    }
}
