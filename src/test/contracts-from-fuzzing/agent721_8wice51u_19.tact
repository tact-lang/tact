contract StringDef {
    s: String = "default";

    receive() {
        self.s = "changed";
    }
}