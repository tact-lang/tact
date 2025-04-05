struct CastTest {
    // Coerce the Int literal into a 4-bit unsigned integer
    field: Int as uint4;
}

contract TestCast {
    receive() {
        // 15 fits into 4 bits (max value 15)
        let a = CastTest { field: 15 };
        dump(a.field); // expecting to dump 15
    }
}
