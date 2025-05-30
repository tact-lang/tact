struct Conf {
    label: String = "xx";
    enabled: Bool = true;
}

struct Wrap {
    inner: Conf;
}

contract TestContract {
    val: Wrap;

    init() {
        self.val = Wrap{ inner: Conf{} };
    }
}