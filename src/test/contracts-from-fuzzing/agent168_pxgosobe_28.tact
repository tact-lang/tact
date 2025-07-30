struct StrOpt {
    name: String?;
}

contract TestStructOpt {
    so: StrOpt;

    init() {
        self.so = StrOpt{ name: null };
    }
}
