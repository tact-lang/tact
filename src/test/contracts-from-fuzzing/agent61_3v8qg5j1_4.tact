contract Test {
    receive() {
        let s: String = "escape \\ for backslash, quote: \" , newline: \n, tab: \t, hex: \x41, uni4: \u0041, univar: \u{41}";
        dump(s);
    }
}
