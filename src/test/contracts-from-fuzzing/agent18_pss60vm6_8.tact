struct S128 {
    value: Int as int128;
}

fun testStructAs128(): S128 {
    return S128 {
        value: 340282366920938463463374607431768211456
    };
}

contract Test {
    receive() {
        testStructAs128();
    }
}
