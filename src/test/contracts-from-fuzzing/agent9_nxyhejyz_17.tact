fun getString(yes: Bool): String? {
    if (yes) {
        return "Yes";
    } else {
        return null;
    }
}

contract TestStrings {
    receive() {
        let value = getString(false);
    }
}