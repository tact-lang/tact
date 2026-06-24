struct Consts {
    t1: Int;
    t2: Int;
    t3: Int;
    t4: Int;
}

const T1: Int = ton("1");
const T2: Int = ascii("⚡");
const T3: Int = crc32("000DEADBEEF000");
const T4: Int = sha256("abc");

contract TestConstants() {
    get fun res() : Consts {
         return Consts{ t1: T1, t2: T2, t3: T3, t4: T4 };
    }
}
