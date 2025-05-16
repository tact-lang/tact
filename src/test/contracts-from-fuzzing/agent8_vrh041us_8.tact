fun multipleControlFlowTest(): Int {
    if (1 == 1) {
        try {
            if (2 == 2) {
                throw(77);
            } else {
                return 1;
            }
        } catch (e) {
            if (e == 77) { 
                return 77; 
            } else { 
                return e; 
            }
        }
    } else {
        return 0;
    }
}

fun deeplyNested(): Int {
    try {
        repeat (3) {
            try {
                throw(33);
            } catch (inner) {
                return inner + 10;
            }
        }
        return -1;
    } catch (outer) {
        return outer;
    }
}

fun branchReturnTest(flag: Bool): Int {
    if (flag) {
        try {
            throw(100);
        } catch (e) {
            return e;
        }
    } else {
        return 200;
    }
}
