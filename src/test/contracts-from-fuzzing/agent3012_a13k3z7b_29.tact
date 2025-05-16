// Persistent optional String with default value
contract OptStrDefault {
    txt: String? = null;

    init() {
        self.txt = null;
    }
}