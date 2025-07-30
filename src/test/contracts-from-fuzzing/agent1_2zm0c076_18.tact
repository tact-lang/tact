struct CastTest {
    val: Int as uint8;
}

contract TestCast {
    receive() {
         let t: CastTest = CastTest { val: 42 };
         let newVal: Int = t.val;
    }
}
