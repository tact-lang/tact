primitive Bool;
primitive Int;

trait BaseTrait { }

const COL: Bool = true || loop();
const COE: Bool = true || exception(0);

const CAL: Bool = false && loop();
const CAE: Bool = false && exception(0);

fun loop(): Bool {
    while(true) {
    }
    return true;
}

// Div by zero when v = 0
fun exception(v: Int): Bool {
    return 1 / v == 0;
}

struct STest {
    sOL: Bool = true || loop();
    sOE: Bool = true || exception(0);
    sAL: Bool = false && loop();
    sAE: Bool = false && exception(0);
}

contract CTest {
    cOL: Bool = true || loop();
    cOE: Bool = true || exception(0);
    cAL: Bool = false && loop();
    cAE: Bool = false && exception(0);

    const ccOL: Bool = true || loop();
    const ccOE: Bool = true || exception(0);
    const ccAL: Bool = false && loop();
    const ccAE: Bool = false && exception(0);
}