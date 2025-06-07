contract OptWithDefaultAssignedLater {
    s: String? = null;
    init() {
        self.s = "zzz";
    }
}