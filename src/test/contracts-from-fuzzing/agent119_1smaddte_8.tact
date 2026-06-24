fun no_semicolon_return(): Int {
    return 77
}

fun block_return_only(): Int {
    { return 55; }
}

contract ValidReceiver {
    receive() {
        dump("Received");
        return;
    }
}

contract ValidGetter {
    v: Int = 21;

    get fun doubleVal(): Int {
       return self.v * 2
    }
}
