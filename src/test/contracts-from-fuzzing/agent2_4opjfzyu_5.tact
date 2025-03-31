fun add_ok(): Int { 
    return 2 + 3;
}

fun add_overflow(): Int {
    try {
        return pow(2, 255) + pow(2, 255);
    } catch (exitCode) {
        return exitCode;
    }
}

fun sub_ok(): Int {
    return 10 - 3;
}

fun sub_underflow(): Int {
    try {
        return -pow(2, 255);
    } catch (exitCode) {
        return exitCode;
    }
}

fun mul_overflow(): Int {
    try {
        return pow(2, 255) * 2;
    } catch (exitCode) {
        return exitCode;
    }
}

fun div_rounding(): Int {
    let a = 6 / 5;   // expected 1
    let b = -6 / 5;  // expected -2
    return a * 100 + b; // expected 100 - 2 = 98
}

fun div_by_zero(): Int {
    try {
        return 42 / 0;
    } catch (exitCode) {
        return exitCode;
    }
}

fun mod_positive(): Int {
    return 7 % 3; // expected 1
}

fun mod_negative(): Int {
    return -1 % 5; // expected 4
}

fun mod_mixed(): Int {
    return 1 % -5; // expected -4
}

fun abs_mod_test(): Int {
    return abs(-1) % abs(-5); // expected 1
}

fun shift_right(): Int {
    return 5 >> 1; // expected 2
}

fun shift_right_negative(): Int {
    return (-5) >> 1; // expected -3 (floor division)
}

fun shift_left(): Int {
    return 1 << 254; // valid
}

fun shift_left_overflow(): Int {
    try {
        return 1 << 256; // expected to overflow: exit code 4
    } catch (exitCode) {
        return exitCode;
    }
}

fun shift_zero(): Int {
    return 0 << 10; // expected 0
}

fun precedence_test(): Int {
    if (pow(2, 254) == (1 << 254)) {
        return 100;
    } else {
        return 0;
    }
}

fun large_subtraction_zero(): Int {
    return pow(2, 255) - pow(2, 255); // expected 0
}

fun main() {
    let _ = add_ok();
    let _ = add_overflow();
    let _ = sub_ok();
    let _ = sub_underflow();
    let _ = mul_overflow();
    let _ = div_rounding();
    let _ = div_by_zero();
    let _ = mod_positive();
    let _ = mod_negative();
    let _ = mod_mixed();
    let _ = abs_mod_test();
    let _ = shift_right();
    let _ = shift_right_negative();
    let _ = shift_left();
    let _ = shift_left_overflow();
    let _ = shift_zero();
    let _ = precedence_test();
    let _ = large_subtraction_zero();
}
