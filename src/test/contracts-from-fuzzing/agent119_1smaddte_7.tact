fun nested_conditional(a: Bool, b: Bool): Int {
    if (a) {
        {
            if (b) {
                return 10;
            }
        }
        return 20;
    } else {
        return 30;
    }
}

contract ReturnReceiver {
    receive() {
        dump(1);
        return;
    }
}

contract ReturnGetter {
    v: Int = 5;

    get fun double(): Int {
        return self.v * 2;
    }
}
