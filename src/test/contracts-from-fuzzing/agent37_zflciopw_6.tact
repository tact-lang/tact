extends fun toCoinsString2(self: Int): String {
    return self.toFloatString(9);
}

extends mutates fun hippityHoppity(self: Int) {
    self += 1;
}

contract TestExtension {
    receive() {
        let a: Int = 5;
        let s: String = a.toCoinsString2(); // should yield "0.000000005"
        dump(s);
        a.hippityHoppity(); // should increment a
        dump(a); // should print 6
        cashback(sender());
    }
}
