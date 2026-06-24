struct StringHolder {
    s: String? = "hi";
}

contract TestC {
    sh: StringHolder;

    init() {
        self.sh = StringHolder{};
    }
}